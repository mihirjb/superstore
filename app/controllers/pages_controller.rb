class PagesController < ApplicationController
  
  before_filter :authenticate_vendor!, :only => [:dashboard]
  layout "home", only: [:home]
  caches_page :alliphones, :allipads, :help, :about, :thanksandshare, :faq, :sellerfaq, :buyerfaq, :terms
 
  
  def home
         @newlistedphones = Phone.find(:all, :order => "updated_at DESC", :limit => 6)
         @mostviewedphones = Phone.find(:all, :order => "impressions_count DESC", :limit => 6)
         @iphones = Phone.where('phonetype LIKE ?', "iPhone")
         @ipads = Phone.where('phonetype LIKE ?', "iPad")
         
  end
  
  
  def searchresults
     @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%").paginate :page => params[:page],:per_page=>30  
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
     @orders = Order.where('seller_id = ? OR vendor_id = ?', @vendor.id,@vendor.id).limit(50)
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
    @phones = Phone.order(:modelname).where("modelname iLike ?", "%#{params[:search]}%") 
    render json: @phones
  end
  
  def alliphones
      @phones = Phone.where("phonetype iLike ?", "iPhone") .paginate :page => params[:page],:per_page=>30
  end
  
  def allipads
      @phones = Phone.where("phonetype iLike ?", "iPad") .paginate :page => params[:page],:per_page=>30
  end
  
  def thanksandshare
   
    @url = "http://www.zalpe.com" + session[:previous_url] + "/" + params[:lid]

  end
  
  
  def terms
  end
  
  def faq
  end
  
  def sellerfaq
  end
  
  def buyerfaq
  end
  
end
