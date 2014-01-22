class BuyerMailer < ActionMailer::Base

  default :from => "info@happyfellas.com"

  def order_confirmation(buyer)
    @buyer = buyer
    mail(:to => "#{buyer.email}", :subject => "Recipt for your order from Zalpe")
  end
end
