class TransactionsController < ApplicationController
  before_filter :authenticate_user!, :except => :notify_action
  skip_before_filter :verify_authenticity_token  
  
   include ActiveMerchant::Billing::Integrations   
   
   def initiatetransaction
     @listing = Listing.find(params[:l])
   end 
   
   
  def processtransaction
    session[:listing_id] = params[:l]
    session[:buyer_id] = current_user.id
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
               :amount => 0.01,
                        :primary => false},
                       {:email => ENV['PAYPAL_EMAIL'],
                         :amount => 0.01,
                        :primary => false}
                        ]
            
      purchase = gateway.setup_purchase(
        :action_type => "CREATE",
        :return_url => url_for(:action => 'completetransaction', :only_path => false),
        :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
        :ipn_notification_url => transactions_notify_action_url(:listing_id => @listing.id,:user_id => current_user.id, :shipping_address => params[:address] ),
        :currency_code => "SGD",
        :receiver_list => recipients
      )
     
      gateway.set_payment_options(
      
        :display_options => {
          :business_name    => "Phonesalad.com"
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
                  :item_price => 0.01,
                  :price => 0.01
                }
              ]
            }
          },
          {
            :receiver => { :email => ENV['PAYPAL_EMAIL'] },
            :invoice_data => {
              :item => [
                { 
                  :name => "Payment for Phonesalad fees",
                  :description => "Phonesalad fees",
                  :item_count => 1,
                  :item_price => 0.01,
                  :price => 0.01
                }
              ]
            }
          }
        ]
      )
      
      
     
      response = gateway.setup_purchase(
      :return_url => url_for(:action => 'completetransaction', :only_path => false),
      :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
      :ipn_notification_url => transactions_notify_action_url(:listing_id => @listing.id,:user_id => current_user.id, :shipping_address => params[:address] ),
      :currency_code => "SGD",
      :receiver_list => recipients
      )
      
     

      redirect_to(gateway.redirect_url_for(purchase["payKey"]))

      
      
      
      
      
      
      
      
     else
       redirect_to :root, :notice => "Invailid request."
       
     end
  end

  def completetransaction    
    if session[:listing_id]
      logger.info "Listing id is #{session[:listing_id]}"
      
      @listing  =  Listing.find(session[:listing_id])
    @order = Order.where('listing_id = ?',session[:listing_id]).first
      AdminMailer.order_confirmation(current_user, @listing).deliver
       UserMailer.order_confirmation(@listing, current_user, @order).deliver
       BuyerMailer.order_confirmation(current_user, @listing, @order).deliver
    
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
    
    response = validate_IPN_notification(request.raw_post)
    
       case response
       when "VERIFIED"
        if params[:status] == "COMPLETED"
          @listing_id = params[:listing_id]
          @user_id = params[:user_id]
           @listing  =  Listing.find(@listing_id)
         @listing.update_column("status", "Sold")
      
      @order = Order.create!(:listing_id => @listing_id, :params => params)
      @ordertotal = 0.01.to_i + 0.01
       @order.update_columns(:user_id => @user_id, :devicename => @listing.devicename, :devicecarrier => @listing.devicecarrier,:deviceimei => @listing.deviceimei, :seller_id => @listing.user_id, :ordertotal => @ordertotal, :selleraddress =>@listing.paypalemail, :orderdate => Time.now.to_date, :ordertime => Time.now, :shipping_address => params[:shipping_address])

        
      end     
           
           
           
         # check that paymentStatus=Completed
         # check that txnId has not been previously processed
         # check that receiverEmail is your Primary PayPal email
         # check that paymentAmount/paymentCurrency are correct
         # process payment
       when "INVALID"
         # log for investigation
         
         logger.info "It is  not verified"
         
       else
         # error
         
         logger.info "Some errror"
         
       end
       render :nothing => true
     end 
     
     
     
     
     protected 
     
     
     def validate_IPN_notification(raw)
       uri = URI.parse('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
       http = Net::HTTP.new(uri.host, uri.port)
       http.open_timeout = 60
       http.read_timeout = 60
       http.verify_mode = OpenSSL::SSL::VERIFY_NONE
       http.use_ssl = true
       response = http.post(uri.request_uri, raw,
                            'Content-Length' => "#{raw.size}",
                            'User-Agent' => "My custom user agent"
                          ).body
     end
    
  
end
