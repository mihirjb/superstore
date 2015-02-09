class SessionsController < Devise::SessionsController
  
  before_filter :authenticate_user!
  layout "forms"
  

 
  def after_sign_in_path_for(user)
     

      if current_user.sign_in_count <= 2
        Profile.find(current_user.id).update_columns(:fullname => current_user.firstname, :paypalemail => current_user.email)
      end
     
    
      session["user_return_to"] || root_url
  end
  

 
  def after_sign_out_path_for(user)
   root_url()  
  end
end