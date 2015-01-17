class AdminactionsController < ApplicationController
  
  before_filter :authenticate_admin!
  
  def approvelisting
    @listing  = Listing.find(params[:id])
    @listing.update_column("status","Approved")
    if @listing.save
      UserMailer.listing_confirmation(@listing).deliver
      redirect_to '/adminactions/dashboard', :notice => "Success, Approved!"
    else
      redirect_to '/adminactions/dashboard', :notice => "Failure, NOT Approved!"
    end
  end
  
  def approvecomment
     @comment  = Comment.find(params[:id])
     @listing = Listing.find(@comment.listing_id)
      @user = User.find(@listing.user_id)
     @comment.update_column("status","Approved")
     
     if @comment.save
       UserMailer.new_comment(@listing,@user).deliver
       
       redirect_to '/adminactions/dashboard', :notice => "Success, Approved!"
     else
       redirect_to '/adminactions/dashboard', :notice => "Failure, NOT Approved!"
     end
   end
  
  def dashboard
    @listings = Listing.where('status iLIKE ?',"Pending")
    @comments = Comment.where('status iLIKE ?',"Pending")
    
  end
  
  def noimagesphones
    @phones = Phone.where(:image_file_name => nil)
    @count = @phones.count
  end
  
  def deletelisting
       @listing = Listing.find(params[:id]).destroy
       redirect_to :back, :notice => "Listing has been removed successfully."
  end
       
  def deletecomment
       @comment = Comment.find(params[:id]).destroy
       redirect_to :back, :notice => "Comment has been removed successfully."
  end
  
  
  def modifylisting
    @listing = Listing.find(params[:id])
      UserMailer.listing_modification(@listing).deliver
      redirect_to :back, :notice => "User notified successfully."
  end
  
 
end
