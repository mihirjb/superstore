class AccountsController < ApplicationController
  def new
       @account = Account.new
       @owner = @account.build_owner
      @profile = @owner.build_profile
      
     end

   def create
     
      @account = Account.create(account_params)
       if @account.save 
         @vendor = Vendor.find_by_account_id(@account.id)
         sign_in @vendor         
          # sign_in(resource)
         redirect_to  session["user_return_to"] || root_url, :notice => "You have been Signed up successfully and Signed in. Please continue!"
          # redirect_to new_vendor_session_path, :notice => "Signed up successfully, now you may login."
       else
         render action: 'new' , :notice => "Sign up failed"
       end

     end

     private 
    def account_params
     params.require(:account).permit(:subdomain, owner_attributes: [:email, :password, :password_confirmation, :account_id, profile_attributes:[:country]])
    end
  
end
