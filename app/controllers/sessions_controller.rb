class SessionsController < Devise::SessionsController
  
  before_filter :authenticate_vendor!
  
  def stored_location_for(resource_or_scope)
      nil
    end
 
  def after_sign_in_path_for(vendor)
    account_id = current_vendor.account_id
    @account = Account.find(account_id)
    subdomain = @account.subdomain
       puts "called from after_sign_in_path"
    dashboard_url(:subdomain => subdomain)  
       end
  
  def after_sign_out_path_for(vendor)
    puts "called from after_sign_out_path"
   root_url(:subdomain => false)  
  end
end