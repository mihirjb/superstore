class VendorMailer < ActionMailer::Base
  default :from => "info@happyfellas.com"

   def order_confirmation(seller)
     @seller = seller
     mail(:to => "#{seller.paypalemail}", :subject => "Order placed on Zalpe")
   end
   
   def listing_confirmation(listing)
     @listing = listing
     mail(:to => "#{listing.paypalemail}", :subject => "Your listing has been approved")
   
   end
end
