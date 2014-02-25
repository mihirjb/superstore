class SessionsController < Devise::SessionsController
  
  before_filter :authenticate_vendor!
  
  def stored_location_for(vendor)
      nil
    end
 
  def after_sign_in_path_for(vendor)
    account_id = current_vendor.account_id
    @account = Account.find(account_id)
    subdomain = @account.subdomain
    
    @profile = Profile.find_by_vendor_id(current_vendor.id)
    
    if @profile.displayname.nil?
      @profile.update_column("displayname",@account.subdomain)
    end
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')  
      if (request.referer == sign_in_url)
        super
      else
        request.referer
       end
     end
  
  def after_sign_out_path_for(vendor)
   root_url()  
  end
end