class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
 
  
  def home
    
     @account = Account.new
     @owner = @account.build_owner
     @profile = @owner.build_profile
     @vendor  = Vendor.new
     if params[:msp]
       if params[:msp] == "AT"
         params[:msp] ="AT&T"
       end
       @phones = Phone.find_all_by_carrier(params[:msp], :limit => 51) 
     else
       @phones = Phone.all.order(:askprice).limit(51)
               end
     
      if params[:search]
       
        @phones = Phone.order(:modelname).where("modelname Like ?", "%#{params[:search]}%").paginate :page => params[:page],:per_page=>30 
     end
     

  end
  
  def help
  end
  
  def about
  end
  
  def dashboard
    
    
    
    
    @vendor = current_vendor
     @listings = Listing.where('vendor_id = ?',@vendor.id).limit(50)
     @profile = Profile.find_by_vendor_id(@vendor.id)
     @feedbacks = Review.where('profile_id = ?',@profile.id).limit(50)
     @orders = Order.where('seller_id = ? OR vendor_id = ?', @vendor.id,@vendor.id) .limit(50)
     @review = @profile.reviews.build
     
   
  end
  
  
  def sell
     @account = Account.new
     @owner = @account.build_owner
     @profile = @owner.build_profile
     @vendor  = Vendor.new
  end
  
  def buy
     @account = Account.new
     @owner = @account.build_owner
     @profile = @owner.build_profile
     @vendor  = Vendor.new
  end
  
  
  
  
  def phones
    @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%") 
    render json: @phones.map(&:modelname)  
  end
end
