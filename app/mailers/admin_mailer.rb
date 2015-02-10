class AdminMailer < ActionMailer::Base

  default :from => "notification@phonesalad.com"

  def order_confirmation(buyer,seller)
    @buyer = buyer
    @seller = seller
    mail(:to => "buchmihir@gmail.com", :subject => "A new order placed on Phonesalad")
  end
  
end
