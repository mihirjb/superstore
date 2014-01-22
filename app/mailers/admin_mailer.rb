class AdminMailer < ActionMailer::Base

  default :from => "info@happyfellas.com"

  def order_confirmation(buyer,seller)
    @buyer = buyer
    @seller = seller
    mail(:to => "buchmihir@gmail.com", :subject => "A new order placed on Zalpe")
  end
  
end
