class TransactionsController < ApplicationController
  def processtransaction
    
      gateway =  ActiveMerchant::Billing::PaypalAdaptivePayment.new(
        :login => "mihir_api1.5ve.in",
        :password => "1389502930",
        :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A37B4GKmRmqL1Nge8gFcGqGEtswk",
        :appid => "APP-80W284485P519543T" )

      some_ammount = "10"
      recipient_ammount = Listing.find(params[:l]).askprice

      recipients = [{:email => 'info@happyfellas.com',
                      :amount => some_ammount,
                      :primary => false},
                     {:email => Listing.find(params[:l]).paypalemail,
                      :amount => recipient_ammount,
                      :primary => false}
                      ]
       response = gateway.setup_purchase(
         :return_url => url_for(:action => 'completetransaction', :only_path => false),
         :cancel_url => url_for(:action => 'failedtransaction', :only_path => false),
         :ipn_notification_url => url_for(:action => 'notify_action', :only_path => false),
         :receiver_list => recipients
       )

       # For redirecting the customer to the actual paypal site to finish the payment.
       redirect_to (gateway.redirect_url_for(response["payKey"]))
  end

  def completetransaction
  end

  def failedtransaction
  end
  
  def notify_action
  end
  
end
