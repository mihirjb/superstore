class BuyerMailer < ActionMailer::Base

  default :from => "notifications@zalpe.com"

  def order_confirmation(buyer,seller, order)
    @order = order
     @buyer = Profile.find_by_user_id(buyer.id)
     @seller = Profile.find_by_user_id(seller.user_id)
      mail(:to => "#{buyer.email}", :subject => "Recipt for your order from Phonesalad")
  end
  
  def shipping_confirmation(order,trackcode)
    @order = order
     @trackcode = trackcode
      @buyerprofile = Profile.find_by_user_id(order.user_id)
      @buyer = User.find(order.user_id)
       mail(:to => "#{@buyer.email}", :subject => "Recipt for your order from Phonesalad")
   end
  
end
