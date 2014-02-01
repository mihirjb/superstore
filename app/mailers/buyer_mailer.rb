class BuyerMailer < ActionMailer::Base

  default :from => "info@happyfellas.com"

  def order_confirmation(buyer,seller, order)
    @order = order
     @buyer = Profile.find_by_vendor_id(buyer.id)
     @seller = Profile.find_by_vendor_id(seller.vendor_id)
      mail(:to => "#{buyer.email}", :subject => "Recipt for your order from Zalpe")
  end
  
  def shipping_confirmation(order,trackcode)
    @order = order
     @trackcode = trackcode
      @buyerprofile = Profile.find_by_vendor_id(order.vendor_id)
      @buyer = Vednor.find(order.vendor_id)
       mail(:to => "#{@buyer.email}", :subject => "Recipt for your order from Zalpe")
   end
  
end
