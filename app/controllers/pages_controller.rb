class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  layout "home", only: [:home]
 
  
  def home
    
     @account = Account.new
     @owner = @account.build_owner
     @profile = @owner.build_profile
     @vendor  = Vendor.new
    
       @phones = Phone.all.limit(51)
       
  end
  
  
  def searchresults
     @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%").paginate :page => params[:page],:per_page=>30  
  end 
  
  
  def att
    @phones = Phone.where("carrier Like ?","AT&T").paginate :page => params[:page],:per_page=>30  
  end
  
  def sprint
     @phones = Phone.where("carrier Like ?","Sprint").paginate :page => params[:page],:per_page=>30  
  end
   
   def tmobile
      @phones = Phone.where("carrier Like ?","T-Mobile").paginate :page => params[:page],:per_page=>30  
   end
  
  def verizon
       @phones = Phone.where("carrier Like ?","Verizon").paginate :page => params[:page],:per_page=>30  
  end
  def unlocked
        @phones = Phone.where("carrier Like ?","Unlocked").paginate :page => params[:page],:per_page=>30  
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
  
  
  def listing
    @listing = Listing.find(params[:id])
    @phone = Phone.find(@listing.phone_id)
    @author = Listing.get_listing_author(@listing.vendor_id)
    @profile = Listing.get_listing_author_profile(@listing.vendor_id)
    if !params[:foo]
    @comment = @listing.comments.build
  end
    @comments = Comment.where("status like ? AND listing_id = ?", "Approved", @listing.id)
    
  end
  
  def phones
    @phones = Phone.order(:modelname).where("modelname Like ?", "%#{params[:search]}%") 
    render json: @phones.map(&:modelname)  
  end
end
