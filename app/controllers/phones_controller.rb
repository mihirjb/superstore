class PhonesController < ApplicationController
  def index
    @phones = Phone.all
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.create(phone_params)
    if @phone.save
      redirect_to :root_path, :notice =>"Phone added Successfully."
    else
      redirect_to :root_path, :notice => "Phone could not be added"
    end
  end
  
  def show
    @phone = Phone.find(params[:id])
    @listings = Listing.find_all_by_phone_id(@phone.id)
  end
  
  
end
