class ListingsController < ApplicationController
  
  before_filter :authenticate_vendor!, :except => [:show]
  
  def index
    @listings = current_vendor.listings.all
    
  end

  def new
    @listing = current_vendor.listings.new
    5.times { @listing.assets.build }
    
  end

  def create
    @listing = current_vendor.listings.create(listing_params())
    if @listing.save
      redirect_to dashboard_url, :notice => "Congratulations, Listing created Successfully."
    else
      redirect_to :back, :notice => "Alas, Listing could not be created."
    end
      
  end

  def show
    @listing = Listing.find(params[:id])
    @author = Listing.get_listing_author(@listing.vendor_id)
    @profile = Listing.get_listing_author_profile(@listing.vendor_id)
    @comment = @listing.comments.build
    @comments = Comment.find_all_by_listing_id(@listing.id)
  end

  def edit
    @listing = current_vendor.listings.find(params[:id])
    5.times { @listing.assets.build }
    
  end

  def update
    @listing = current_vendor.listings.find(params[:id])
     if @listing.update(listing_params())
        redirect_to dashboard_url, :notice => "Congratulations, Listing updated Successfully."
      else
        redirect_to :back, :notice => "Alas, Listing could not be updated."
      end
  end

  def destroy
    @listing = Listing.find(params[:id]).destroy
  end
  
  
    private 
    def listing_params
     params.require(:listing).permit(:phone_id, :headline, :description, :devicecondition, :askprice,:expirydate, :modified, :accessories, :country, :itemlocation, :shipinternationally, :paypalconfirmed, :returnsallowed, :returnpolicy, :paypalemail,:devicename, :deviceimei, :devicecarrier, :devicecolor,:devicestorage,:shippingdetails, assets_attributes:[:image_file_name, :image_file_size, :image_content_type, :image], comments_attributes: [:commentbody,:vendor_id])
    end
 
end
