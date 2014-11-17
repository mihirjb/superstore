class AccountsController < ApplicationController
  def new
       @account = Account.new
       @owner = @account.build_owner
      @profile = @owner.build_profile
      
     end

   def create
     
      @account = Account.create(account_params)
       if @account.save 
         sign_in(:vendor, Vendor.find_by_account_id(@account.id))
       else
         render action: 'new' , :notice => "Sign up failed"
       end

     end

     private 
    def account_params
     params.require(:account).permit(:subdomain, owner_attributes: [:email, :password, :password_confirmation, :account_id, profile_attributes:[:country]])
    end
  
end
