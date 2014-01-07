class ListingsController < ApplicationController
  
  before_filter :authenticate_vendor!, :except => [:show]
  
  def index
    @listings = current_vendor.listings.all
  end

  def new
    @listing = current_vendor.listings.new
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
    @author = Vendor.find(@listing.vendor_id)
  end

  def edit
    @listing = current_vendor.listings.find(params[:id])
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
     params.require(:listing).permit(:headline, :description, :devicecondition, :askprice,:expirydate, :modified, :accessories, :country, :itemlocation, :shipinternationally, :paypalconfirmed, :returnsallowed, :returnpolicy, :paypalemail,:devicename, :deviceimei, :devicecarrier, :devicecolor,:devicestorage,:shippingdetails)
    end
 
end
