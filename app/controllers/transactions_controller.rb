class TransactionsController < ApplicationController
  before_filter :authenticate_vendor!
  skip_before_filter :verify_authenticity_token  
  
   include ActiveMerchant::Billing::Integrations   
   
   def initiatetransaction
   end 
   
   
  def processtransaction
    session[:listing_id] = params[:l]
    session[:buyer_id] = current_vendor.id
    session[:shipping_address] = params[:address]
    
  
    if Listing.find(params[:l]).status == "Approved"
      
      @listing =  Listing.find(params[:l])
      
      gateway =  ActiveMerchant::Billing::PaypalAdaptivePayment.new(
      :login => "mihir_api1.5ve.in",
      :password => "1389502930",
      :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A37B4GKmRmqL1Nge8gFcGqGEtswk",
      :appid => "APP-80W284485P519543T" )
            
             recipients = [{:email => Listing.find(params[:l]).paypalemail,
               :amount => @listing.askprice,
                        :primary => false},
                       {:email => ENV['PAYPAL_EMAIL'],
                         :amount => 10,
                        :primary => false}
                        ]
            
      purchase = gateway.setup_purchase(
        :action_type => "CREATE",
        :return_url => url_for(:action => 'completetransaction', :only_path => false),
        :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
        :ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
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
                  :item_price => 10,
                  :price => 10
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
      :receiver_list => recipients
      )
      
     

      redirect_to(gateway.redirect_url_for(purchase["payKey"]))

      
      
      
      
      
      
      
      
     else
       redirect_to :root, :notice => "Invailid request."
       
     end
  end

  def completetransaction    
    if session[:listing_id]
      @listing  =  Listing.find(session[:listing_id])
   @listing.update_column("status", "Sold")
    @lid = session[:listing_id]

    @order = Order.create(:vendor_id => current_vendor.id, :devicename => @listing.devicename, :devicecarrier => @listing.devicecarrier,:deviceimei => @listing.deviceimei, :seller_id => @listing.vendor_id, :ordertotal => @listing.askprice, :selleraddress =>@listing.paypalemail, :orderdate => Time.now.to_date, :ordertime => Time.now, :shipping_address => session[:shipping_address], :listing_id => session[:listing_id])
    
    AdminMailer.order_confirmation(current_vendor, @listing).deliver
    VendorMailer.order_confirmation(@listing, current_vendor, @order).deliver
    BuyerMailer.order_confirmation(current_vendor, @listing, @order).deliver
    
    session[:listing_id] = nil
  else
    redirect_to :root, :notice => "Invalid request"
  end 
    
  end

  def failedtransaction
     if session[:listing_id]
       session[:listing_id] = nil
     else
       redirect_to :root, :notice => "Invalid request"
     end
  end
  
  def notify_action
    notify = ActiveMerchant::Billing::Integrations::PaypalAdaptivePayment::Notification.new(request.raw_post)
          logger.debug "Notification object is #{notify}"
          if notify.acknowledge
              logger.debug "Transaction ID is #{notify.transaction_id}"
              logger.debug "Notification object is #{notify}"
              logger.debug "Notification status is #{notify.status}"
          end        
          render :nothing => true
  end
  
end
