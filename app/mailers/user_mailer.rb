class UserMailer < ActionMailer::Base
  default :from => "notification@phonesalad.com"

   def order_confirmation(seller, buyer, order)
     @order = order
     @buyer = Profile.find_by_user_id(buyer.id)
     @seller = Profile.find_by_user_id(seller.user_id)
     @sellername = User.find(@order.seller_id).firstname
     @useremail = User.find(@order.seller_id).email
     @listing = seller
     
     mail(:to => "#{@useremail}", :subject => "Order placed on Phonesalad")
   end
   
   def listing_confirmation(listing)
     @listing = listing
     @useremail = User.find(listing.user_id).email
     mail(:to => "#{@useremail}", :subject => "Your listing has been approved")
   
   end
   
   def listing_modification(listing)
      @listing = listing
      @useremail = User.find(listing.user_id).email

      mail(:to => "#{@useremail}", :subject => "Modify your listing at phonesalad.com")

    end
     def new_comment(listing,user)
        @listing = listing
        @user = user
        mail(:to => "#{user.email}", :subject => "New comment on your listing on phonesalad.com")

      end
    
   
end
