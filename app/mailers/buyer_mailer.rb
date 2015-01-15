class BuyerMailer < ActionMailer::Base

  default :from => "notifications@zalpe.com"

  def order_confirmation(buyer,seller, order)
    @order = order
     @buyer = Profile.where('user_id =?',buyer.id).first
     @seller = Profile.where('user_id =?',seller.user_id).first
     @listing = seller
      mail(:to => "#{buyer.email}", :subject => "Recipt for your order from Zalpe")
  end
  
  def shipping_confirmation(order,trackcode)
    @order = order
     @trackcode = trackcode
      @buyerprofile = Profile.find_by_vendor_id(order.vendor_id)
      @buyer = Vendor.find(order.vendor_id)
       mail(:to => "#{@buyer.email}", :subject => "Recipt for your order from Zalpe")
   end
  
end
