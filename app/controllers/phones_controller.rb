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
    
    @phone = Phone.find(params[:id])
    if params['sort']
      if params['sort'] == "l2h"
      @listings = Listing.where("phone_id = ? AND status iLIKE ?",@phone.id, "Approved").order("askprice ASC").paginate :page => params[:page],:per_page=>30
    elsif params['sort'] == "h2l"
      @listings = Listing.where("phone_id = ? AND status iLIKE ?",@phone.id, "Approved").order("askprice DESC").paginate :page => params[:page],:per_page=>30
    elsif params['sort'] == "n2o"
      @listings = Listing.where("phone_id = ? AND status iLIKE ?",@phone.id, "Approved").order("created_at DESC").paginate :page => params[:page],:per_page=>30
    elsif params['sort'] == "o2n"
      @listings = Listing.where("phone_id = ? AND status iLIKE ?",@phone.id, "Approved").order("created_at ASC").paginate :page => params[:page],:per_page=>30
    end
      
      
    else
      @listings = Listing.where("phone_id = ? AND status LIKE ?",@phone.id, "Approved").paginate :page => params[:page],:per_page=>30
      
    end
    
      
      respond_to do |format|
         format.html
         format.json { render json: @listings}
        end
  end
  
  
  def edit
     @phone = Phone.find(params[:id])
   end

   def update
     
     @phone = Phone.find(params[:id])
      if @phone.update(phone_params())
         redirect_to "/adminactions/noimagesphones", :notice => "Congratulations, phone updated Successfully."
       else
         redirect_to :back, :notice => "Alas, phone could not be updated."
       end
   end

   def destroy     
     
     @phone = Phone.find(params[:id]).destroy
   end
  
  
  
  private 
   def phone_params
    params.require(:phone).permit(:phonetype, :modelname, :carrier, :image, :image_file_name, :image_content_type, :image_file_size)
   end
  
end
