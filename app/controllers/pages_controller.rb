class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  
  def home
     @account = Account.new
     @owner = @account.build_owner
     @phones = Phone.all :limit => 50 
     
  end
  
  def help
  end
  
  def about
  end
  
  def dashboard
    @vendor = current_vendor
     
  end
end
