class SessionsController < Devise::SessionsController
  
  before_filter :authenticate_vendor!
  

 
  def after_sign_in_path_for(vendor)
     

      if current_vendor.sign_in_count < 2
        account_id = current_vendor.account_id
          @account = Account.find(account_id)
          subdomain = @account.subdomain

          @profile = Profile.find_by_vendor_id(current_vendor.id)
        @profile.update_column("displayname",@account.subdomain)
      end
     
    
      session["user_return_to"] || root_url 
  end
  

 
  def after_sign_out_path_for(vendor)
   root_url()  
  end
end