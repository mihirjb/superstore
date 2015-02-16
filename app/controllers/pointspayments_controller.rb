class PointspaymentsController < ApplicationController
  
  before_filter :authenticate_user!, :except => :notify_action
  skip_before_filter :verify_authenticity_token
  
  def initiatepayment
       @user = current_user
   end 


   def processpayment
     session[:user_id] = current_user.id
     session[:ammount] = params[:ammount] 
     @ammount = 0.01   
     session[:credits] = params[:credits]     

     gateway =  ActiveMerchant::Billing::PaypalAdaptivePayment.new(
     :login => ENV['PAYPAL_UNAME'],
     :password => ENV['PAYPAL_PW'],
     :signature => ENV['PAYPAL_SIGNATURE'],
     :appid => ENV['PAYPAL_APPID']
     
     )
           
            recipients = [{:email => "wishwa.trivedi@gmail.com",
              :amount => @ammount,
                       :primary => false},
                      {:email => ENV['PAYPAL_EMAIL'],
                        :amount => @ammount,
                       :primary => false}
                       ]
           
     purchase = gateway.setup_purchase(
       :action_type => "CREATE",
        :return_url => url_for(:action => 'completedpayment', :only_path => false),
        :cancel_url => url_for(:action => 'failedpayment', :only_path => false),
        :ipn_notification_url => transactions_notify_action_url(:user_id => current_user.id, :credits => params[:credits] ),
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
           :receiver => { :email =>  "wishwa.trivedi@gmail.com" },
           :invoice_data => {
             :item => [
               { 
                 :name => "Payment",
                 :item_count => 1,
                 :item_price => @ammount,
                 :price => @ammount
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
                 :item_price => @ammount,
                 :price => @ammount
               }
             ]
           }
         }
       ]
     )
     
     
    
     response = gateway.setup_purchase(
     :return_url => url_for(:action => 'completedpayment', :only_path => false),
     :cancel_url => url_for(:action => 'failedpayment', :only_path => false),
     :ipn_notification_url => transactions_notify_action_url(:user_id => current_user.id, :credits => params[:credits] ),
     :currency_code => "SGD",
     :receiver_list => recipients
     )
     
    

     redirect_to(gateway.redirect_url_for(purchase["payKey"]))

     
     
     
     
    
   end

   def completedpayment   
     if session[:user_id]
    current_user.add_credits
    session[:ammount] = nil
    session[:credits] = nil
     session[:user_id] = nil
     redirect_to "/pages/dashboard", :notice => "Credits added successfully to your account"
   else
     redirect_to :root, :notice => "Invalid request"
   end 

   end

   def failedpayment
      if session[:user_id]
        session[:ammount] = nil
        session[:credits] = nil
        session[:user_id] = nil
        redirect_to "/pages/dashboard", :notice => "We could not add credits to your account. Please try agian!"
        
      else
        redirect_to :root, :notice => "Invalid request"
      end
   end




   def notify_action

     response = validate_IPN_notification(request.raw_post)

        case response
        when "VERIFIED"
         if params[:status] == "COMPLETED"
           @user_id = params[:user_id]
           @credits = params[:credits]
          @user  =  User.find(@user_id)
          @user.update_column("credits", @credits)

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
