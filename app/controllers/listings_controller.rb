class ListingsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show]
  impressionist :actions=>[:show]
  layout "forms", :only => [:new, :edit]
  
  def index
    @listings = current_user.listings.all
    respond_to do |format|
      format.html
      format.json do
        # User#to_public_json will remove sensitive elements from the user object
        render :json => @listing.to_public_json
      end
    end
  end

  def new
    if !params[:foo]
    @listing = current_user.listings.new
    5.times { @listing.assets.build }
  end
  end

  def create
    
    @listing = current_user.listings.create(listing_params())
    if @listing.save
      Listing.get_paypal_status(@listing.paypalemail,@listing.paypalfname,@listing.paypallname,@listing.id)
      redirect_to "/pages/thanksandshare?lid=#{@listing.id}", :notice => "Congratulations, Listing created Successfully."
    else
     redirect_to :back, :notice => "Alas your listing could not be saved as there were errors."
    end
      
  end

  def show
    @listing = Listing.find(params[:id])
    @phone = Phone.find(@listing.phone_id)
    @author = Listing.get_listing_author(@listing.user_id)
    @profile = Listing.get_listing_author_profile(@listing.user_id)
    if !params[:foo]
    @comment = @listing.comments.build
  end
    @comments = Comment.where("status like ? AND listing_id = ?", "Approved", @listing.id)
    
  end

  def edit
    
    @listing = current_user.listings.find(params[:id])
    if @listing.status == "Sold"
      redirect_to :root, :notice => "Listing has already been Sold. Sorry you cannot perform edit on it now."
      else 
    5.times { @listing.assets.build }
  end
    
  end

  def update
    
    @listing = current_user.listings.find(params[:id])
     if @listing.update(listing_params())
       Listing.get_paypal_status(@listing.paypalemail,@listing.paypalfname,@listing.paypallname,@listing.id)
        redirect_to "/listings/#{@listing.id}", :notice => "Congratulations, Listing updated Successfully."
      else
        redirect_to :back, :notice => "Alas, Listing could not be updated."
      end
  end

  def destroy
    
    @listing = Listing.find(params[:id]).destroy
    redirect_to :back, :notice => "Listing has been removed successfully."
    end
  

  
  
    private 
    def listing_params
     params.require(:listing).permit(:deliveryby,:pickupaddress,:paypalstatus,:status, :terms, :phone_id, :headline, :description, :devicecondition, :askprice,:expirydate, :modified, :accessories, :country, :itemlocation, :shipinternationally, :paypalconfirmed, :returnsallowed, :returnpolicy, :paypalemail,:paypalfname,:paypallname,:devicename, :deviceimei, :devicecarrier, :moddetails, :devicecolor,:devicestorage,:shippingdetails, assets_attributes:[:image_file_name, :image_file_size, :image_content_type, :image], comments_attributes: [:commentbody,:user_id])
    end
 
end
