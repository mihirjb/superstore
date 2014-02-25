class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  set_current_tenant_by_subdomain(:account, :subdomain)
  after_filter :store_location
  
  def store_location
     # store last url - this is needed for post-login redirect to whatever the user last visited.
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
         request.fullpath != "/accounts/edit" &&
         !request.xhr?) # don't store ajax calls
       session[:previous_url] = request.fullpath 
     end
   end
  
 
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  
end
