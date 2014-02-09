class PhonesController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index,:show]
  
  
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
    @listings = Listing.where("phone_id = ?",@phone.id).paginate :page => params[:page],:per_page=>30
  end
  
  
  def edit
     @phone = Phone.find(params[:id])
   end

   def update
     
     @phone = Phone.find(params[:id])
      if @phone.update(phone_params())
         redirect_to root_url, :notice => "Congratulations, phone updated Successfully."
       else
         redirect_to :back, :notice => "Alas, phone could not be updated."
       end
   end

   def destroy     
     
     @phone = Phone.find(params[:id]).destroy
   end
  
  
  
  private 
   def phone_params
    params.require(:phone).permit(:modelname, :carrier, :image, :image_file_name, :image_content_type, :image_file_size)
   end
  
end
