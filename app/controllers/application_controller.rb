class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  set_current_tenant_by_subdomain(:account, :subdomain)
  after_filter :store_location
  before_filter :set_return_path 
  
  
  
 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  

  

  def set_return_path
    unless devise_controller? || request.xhr? || !request.get?
       if (request.fullpath != "/vendors/sign_in" &&
           request.fullpath != "/vendors/sign_up" &&
           request.fullpath != "/vendors/password" &&
           request.fullpath != "/vendors/sign_out" &&
           request.fullpath != "/admins/sign_in" &&
           request.fullpath != "/admins/sign_up" &&
           request.fullpath != "/admins/password" &&
           request.fullpath != "/admins/sign_out" &&
           request.fullpath != "/accounts" &&
           request.fullpath != "/accounts/new" &&
           request.fullpath != "/accounts/create" &&
           request.fullpath != "/accounts/edit")
           
           session["user_return_to"] = request.url
        end
    end
  end
  
  
end
