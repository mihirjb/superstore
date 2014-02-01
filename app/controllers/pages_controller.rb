class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  
  def home
    
     @account = Account.new
     @owner = @account.build_owner
     @profile = @owner.build_profile
     
     if params[:msp]
       if params[:msp] == "AT"
         params[:msp] ="AT&T"
       end
       @phones = Phone.find_all_by_carrier(params[:msp], :limit => 51) 
     else
       @phones = Phone.all :limit => 51         
     end
     
      if params[:search]
        @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%") 
       
     end
  end
  
  def help
  end
  
  def about
  end
  
  def dashboard
    @vendor = current_vendor
     @listings = Listing.where('vendor_id == ? AND status != ?', @vendor.id, "Sold")
     @profile = Profile.find_by_vendor_id(@vendor.id)
     @feedbacks = Review.find_all_by_profile_id(@profile.id)
     @orders = Order.where('seller_id == ? OR vendor_id == ?', @vendor.id,@vendor.id) #this works on heroku
  end
  
  
  def phones
    @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%") 
    render json: @phones.map(&:modelname)  
  end
end
