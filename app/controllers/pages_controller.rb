class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:dashboard]
  layout "home", only: [:home]
 
  
  def home
       
  end
  
  
  def searchresults
     @phones = Phone.order(:modelname).where("modelname iLIKE ?", "%#{params[:search].downcase}%").paginate :page => params[:page],:per_page=>30  
  end 
  
 
  def help
  end
  
  def about
  end
  
  def dashboard
      
    
    @user = current_user
     @listings = Listing.where('user_id = ?',@user.id).limit(50)
     @profile = Profile.where('user_id = ?',current_user.id).first     
    @feedbacks = Review.where('profile_id = ?',@profile.id).limit(50)
     @orders = Order.where('seller_id = ? OR user_id = ?', @user.id,@user.id).limit(50)
     @review = @profile.reviews.build
     
   
  end
  
  
  def sell
    
  end
  
  def buy
  
  end
  
  
  def listing
    @listing = Listing.find(params[:id])
    @phone = Phone.find(@listing.phone_id)
    @author = Listing.get_listing_author(@listing.user_id)
    @profile = Listing.get_listing_author_profile(@listing.user_id)
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
      @phones = Phone.where("phonetype iLIKE ? AND company iLIKE ?", "phone", "Apple") .paginate :page => params[:page],:per_page=>30
  end
  
  def allipads
      @phones = Phone.where("phonetype iLIKE ? AND company iLIKE ?", "tablet", "Apple") .paginate :page => params[:page],:per_page=>30
  end
  
  def thanksandshare
   
    @url = "http://www.phonesalad.com" + session[:previous_url] + "/" + params[:lid]

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
