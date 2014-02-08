class VendorMailer < ActionMailer::Base
  default :from => "notifications@zalpe.com"

   def order_confirmation(seller, buyer, order)
     @order = order
     @buyer = Profile.find_by_vendor_id(buyer.id)
     @seller = Profile.find_by_vendor_id(seller.vendor_id)
     mail(:to => "#{seller.paypalemail}", :subject => "Order placed on Zalpe")
   end
   
   def listing_confirmation(listing)
     @listing = listing
     mail(:to => "#{listing.paypalemail}", :subject => "Your listing has been approved")
   
   end
end
