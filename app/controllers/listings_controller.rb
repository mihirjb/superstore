class ListingsController < ApplicationController
  
  before_filter :authenticate_vendor!, :except => [:show]
  impressionist :actions=>[:show]
  
  
  def index
    @listings = current_vendor.listings.all
    
  end

  def new
    if !params[:foo]
    @listing = current_vendor.listings.new
    5.times { @listing.assets.build }
  end
  end

  def create
    
    @listing = current_vendor.listings.create(listing_params())
    if @listing.save
      Listing.get_paypal_status(@listing.paypalemail,@listing.id)
      redirect_to dashboard_url, :notice => "Congratulations, Listing created Successfully."
    else
     redirect_to :back, :notice => "Alas your listing could not be saved as there were errors."
    end
      
  end

  def show
    @listing = Listing.find(params[:id])
    @phone = Phone.find(@listing.phone_id)
    @author = Listing.get_listing_author(@listing.vendor_id)
    @profile = Listing.get_listing_author_profile(@listing.vendor_id)
    if !params[:foo]
    @comment = @listing.comments.build
  end
    @comments = Comment.where("status like ? AND listing_id = ?", "Approved", @listing.id)
    
  end

  def edit
    
    @listing = current_vendor.listings.find(params[:id])
    if @listing.status == "Sold"
      redirect_to :root, :notice => "Listing has already been Sold. Sorry you cannot perform edit on it now."
      else 
    5.times { @listing.assets.build }
  end
    
  end

  def update
    
    @listing = current_vendor.listings.find(params[:id])
     if @listing.update(listing_params())
       Listing.get_paypal_status(@listing.paypalemail,@listing.id)
        redirect_to "/listings/#{@listing.id}", :notice => "Congratulations, Listing updated Successfully."
      else
        redirect_to :back, :notice => "Alas, Listing could not be created."
      end
  end

  def destroy
    
    @listing = Listing.find(params[:id]).destroy
  end
  

  
  
    private 
    def listing_params
     params.require(:listing).permit(:paypalstatus,:status, :terms, :phone_id, :headline, :description, :devicecondition, :askprice,:expirydate, :modified, :accessories, :country, :itemlocation, :shipinternationally, :paypalconfirmed, :returnsallowed, :returnpolicy, :paypalemail,:devicename, :deviceimei, :devicecarrier, :moddetails, :devicecolor,:devicestorage,:shippingdetails, assets_attributes:[:image_file_name, :image_file_size, :image_content_type, :image], comments_attributes: [:commentbody,:vendor_id])
    end
 
end
