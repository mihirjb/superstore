class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  
  def home
     @account = Account.new
     @owner = @account.build_owner
     @listings = Listing.all
  end
  
  def help
  end
  
  def about
  end
  
  def dashboard
    @vendor = current_vendor
  end
end
