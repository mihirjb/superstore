class PhonesController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:index,:show]
  impressionist :actions=>[:show]
  
  
  def index
    @phones = Phone.all.paginate :page => params[:page],:per_page=>30
    respond_to do |format|
      format.html
      format.json { render json: @phones}
      end
  end

  def new
    @phone = Phone.new
  end

  def create    
    
    @phone = Phone.create(phone_params)
    if @phone.save
      redirect_to :root, :notice =>"Phone added Successfully."
    else
      redirect_to :root, :notice => "Phone could not be added"
    end
  end
  
  def show
    
    @phone = Phone.friendly.find(params[:id])
   
      @listings = Listing.friendly.where("phone_id = ? AND status LIKE ?",@phone.id, "Approved").paginate :page => params[:page],:per_page=>30 
        filtering_params(params).each do |key, value|
          @listings = @listings.public_send(key, value).paginate :page => params[:page],:per_page=>30 if value.present?
        end      
    
      
      respond_to do |format|
         format.html
         format.json { render json: @listings}
        end
  end
  
  
  def edit
     @phone = Phone.friendly.find(params[:id])
   end

   def update
     
     @phone = Phone.friendly.find(params[:id])
      if @phone.update(phone_params())
         redirect_to "/adminactions/noimagesphones", :notice => "Congratulations, phone updated Successfully."
       else
         redirect_to :back, :notice => "Alas, phone could not be updated."
       end
   end

   def destroy     
     
     @phone = Phone.friendly.find(params[:id]).destroy
   end
  
  
  
  private 
   def phone_params
    params.require(:phone).permit(:phonetype, :modelname, :carrier, :image, :image_file_name, :image_content_type, :image_file_size)
   end
   def filtering_params(params)
     params.slice(:devicecolor, :devicecondition, :devicestorage)
   end
end
