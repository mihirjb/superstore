class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  
  def home
    
     @account = Account.new
     @owner = @account.build_owner
     
     if params[:msp]
       if params[:msp] == "AT"
         params[:msp] ="AT&T"
       end
       @phones = Phone.find_all_by_carrier(params[:msp], :limit => 51) 
     else
       @phones = Phone.all :limit => 51         
     end
     
      if params[:search]
        @phones = Phone.order(:modelname).where("modelname like ?", "%#{params[:search]}%") 
       
     end
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
  
  
  def phones
    @phones = Phone.order(:modelname).where("modelname like ?", "%#{params[:search]}%") 
    render json: @phones.map(&:modelname)  
  end
end
