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
  
  
  
  def create
      respond_to do |format|
        format.html {
          super
        }
        format.json {
          build_resource
          user = User.find_for_database_authentication(:email => params[:user][:email])
          return invalid_login_attempt unless resource

          if user.valid_password?(params[:user][:password])
            render :json => { :auth_token => user.authentication_token }, success: true, status: :created
          else
            invalid_login_attempt
          end
        }
      end
    end

    def destroy
      respond_to do |format|
        format.html {
          super
        }
        format.json {
          user = User.find_by_authentication_token(params[:auth_token])
          if user
            user.reset_authentication_token!
            render :json => { :message => 'Session deleted.' }, :success => true, :status => 204
          else
            render :json => { :message => 'Invalid token.' }, :status => 404
          end
        }
      end
    end

    protected
    def invalid_login_attempt
      warden.custom_failure!
      render json: { success: false, message: 'Error with your login or password' }, status: 401
    end
  end
end