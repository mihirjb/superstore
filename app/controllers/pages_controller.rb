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
     @listings = Listing.find_all_by_vendor_id(@vendor.id)
     @profile = Profile.find_by_vendor_id(@vendor.id)
     @feedbacks = Review.find_all_by_profile_id(@profile.id)
  end
end
