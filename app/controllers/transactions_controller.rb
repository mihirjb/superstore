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
      :login => ENV['PAYPAL_UNAME'],
      :password => ENV['PAYPAL_PW'],
      :signature => ENV['PAYPAL_SIGNATURE'],
      :appid => ENV['PAYPAL_APPID']
      
      )
            
           recipients = [{:email => Listing.find(params[:l]).paypalemail,
                            :amount => @listing.askprice,
                            :primary => true},
                           {:email => ENV['PAYPAL_EMAIL'],
                            :amount => 0.1,
                            :primary => false}
                            ]
             response = gateway.setup_purchase(
               :return_url => url_for(:action => 'action', :only_path => false),
               :cancel_url => url_for(:action => 'action', :only_path => false),
               :ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
               :receiver_list => recipients
             )

             # For redirecting the customer to the actual paypal site to finish the payment.
             redirect_to (gateway.redirect_url_for(response["payKey"]))
           
      
      
      
      
      
      
      
      
     else
       redirect_to :root, :notice => "Invailid request."
       
     end
  end

  def completetransaction    
    if session[:listing_id]
      @listing  =  Listing.find(session[:listing_id])
   @listing.update_column("status", "Sold")
    @lid = session[:listing_id]
    
    @ordertotal = @listing.askprice.to_i + 10

    @order = Order.create(:vendor_id => current_vendor.id, :devicename => @listing.devicename, :devicecarrier => @listing.devicecarrier,:deviceimei => @listing.deviceimei, :seller_id => @listing.vendor_id, :ordertotal => @ordertotal, :selleraddress =>@listing.paypalemail, :orderdate => Time.now.to_date, :ordertime => Time.now, :shipping_address => session[:shipping_address], :listing_id => session[:listing_id])
    
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
