class TransactionsController < ApplicationController
  before_filter :authenticate_vendor!, :only => :processtransaction
  skip_before_filter :verify_authenticity_token
  
   include ActiveMerchant::Billing::Integrations   
   
   def initiatetransaction
     @listing = Listing.find(params[:l])
   end 
   
   
  def processtransaction
    session[:listing_id] = params[:l]
    session[:buyer_id] = current_vendor.id
    session[:shipping_address] = params[:address]
    
  
    if Listing.find(params[:l]).status == "Approved"
      
      @listing =  Listing.find(params[:l])
      
    
      gateway =  ActiveMerchant::Billing::PaypalAdaptivePayment.new(
      :login => ENV['PAYPAL_UNAME'],
      :password => ENV['PAYPAL_PW'],
      :signature => ENV['PAYPAL_SIGNATURE'],
      :appid => ENV['PAYPAL_APPID']
      
      )
            
             recipients = [{:email => Listing.find(params[:l]).paypalemail,
               :amount => @listing.askprice,
                        :primary => false},
                       {:email => ENV['PAYPAL_EMAIL'],
                         :amount => 0.10,
                        :primary => false}
                        ]
            
      purchase = gateway.setup_purchase(
        :action_type => "CREATE",
        :return_url => url_for(:action => 'completetransaction', :only_path => false),
        :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
        :ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
        :currency_code => "SGD",
        :receiver_list => recipients
      )
     
      gateway.set_payment_options(
      
        :display_options => {
          :business_name    => "Zalpe.com"
        },
        :pay_key => purchase["payKey"],
        :receiver_options => [
          {
            :receiver => { :email =>  @listing.paypalemail },
            :invoice_data => {
              :item => [
                { 
                  :name => "Payment - #{@listing.devicename}",
                  :item_count => 1,
                  :item_price => @listing.askprice,
                  :price => @listing.askprice
                }
              ]
            }
          },
          {
            :receiver => { :email => ENV['PAYPAL_EMAIL'] },
            :invoice_data => {
              :item => [
                { 
                  :name => "Payment for Zalpe fees",
                  :description => "Zalpe fees",
                  :item_count => 1,
                  :item_price => 0.10,
                  :price => 0.10
                }
              ]
            }
          }
        ]
      )
      
      
     
      response = gateway.setup_purchase(
      :return_url => url_for(:action => 'completetransaction', :only_path => false),
      :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
      :ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
      :currency_code => "SGD",
      :receiver_list => recipients
      )
      
     

      redirect_to(gateway.redirect_url_for(purchase["payKey"]))

      
      
      
      
      
      
      
      
     else
       redirect_to :root, :notice => "Invailid request."
       
     end
  end

  def completetransaction    

   
   
   
    
  end

  def failedtransaction
     if session[:listing_id]
       session[:listing_id] = nil
     else
       redirect_to :root, :notice => "Invalid request"
     end
  end
  
  def notify_action
     if session[:listing_id]
       @listing  =  Listing.find(session[:listing_id])
    @listing.update_column("status", "Sold")
      @lid = session[:listing_id]

      @ordertotal = @listing.askprice.to_i + 20
    
    notify = ActiveMerchant::Billing::Integrations::PaypalAdaptivePayment::Notification.new(request.raw_post)
          logger.debug "Notification object is #{notify}"
          if notify.acknowledge
            
            Order.create!(:params => params,:vendor_id => current_vendor.id, :devicename => @listing.devicename, :devicecarrier => @listing.devicecarrier,:deviceimei => @listing.deviceimei, :seller_id => @listing.vendor_id, :ordertotal => @ordertotal, :selleraddress =>@listing.paypalemail, :orderdate => Time.now.to_date, :ordertime => Time.now, :shipping_address => session[:shipping_address], :listing_id => session[:listing_id], :pptransactionid => params[:txn_id])
              logger.debug "Transaction ID is #{notify.transaction_id}"
              logger.debug "Notification object is #{notify}"
              logger.debug "Notification status is #{notify.status}"
          end        
          render :nothing => true
           session[:listing_id] = nil
          else
            redirect_to :root, :notice => "Invalid request"
    end
  end
  
end
