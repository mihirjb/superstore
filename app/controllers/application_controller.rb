class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_location
  before_filter :set_return_path 
  
  
  def store_location
     # store last url - this is needed for post-login redirect to whatever the user last visited.
     if (request.fullpath != "/users/sign_in" &&
         request.fullpath != "/users/sign_up" &&
         request.fullpath != "/users/password" &&
         request.fullpath != "/users/sign_out" &&
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
  

  

  def set_return_path
    unless devise_controller? || request.xhr? || !request.get?
       if (request.fullpath != "/users/sign_in" &&
           request.fullpath != "/users/sign_up" &&
           request.fullpath != "/users/password" &&
           request.fullpath != "/users/sign_out" &&
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
