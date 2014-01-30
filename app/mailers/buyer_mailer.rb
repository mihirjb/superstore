class BuyerMailer < ActionMailer::Base

  default :from => "info@happyfellas.com"

  def order_confirmation(buyer,seller, order)
    @order = order
     @buyer = Profile.find_by_vendor_id(buyer.id)
     @seller = Profile.find_by_vendor_id(seller.vendor_id)
      mail(:to => "#{buyer.email}", :subject => "Recipt for your order from Zalpe")
  end
end
