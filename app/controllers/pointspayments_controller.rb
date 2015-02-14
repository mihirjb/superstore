class PointspaymentsController < ApplicationController
  
  before_filter :authenticate_user!, :except => :notify_action
  skip_before_filter :verify_authenticity_token
  
  def initiatepayment
   @user = current_user
   end 


   def paypal_url(return_url)
      values = { 
          :business => 'payments@zalpe.com',
              :cmd => '_cart',
          :upload => 1,
          :return => return_url,
          }   values.merge!({ 
          "amount_1" => 0.01,
          "item_name_1" => "payment for credits",
          "item_number_1" => "1",
          "quantity_1" => '1'
          })
          "https://www.paypal.com/cgi-bin/webscr?&#8221" + values.to_query

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
