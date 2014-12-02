class AdminactionsController < ApplicationController
  
  before_filter :authenticate_admin!
  
  def approvelisting
    @listing  = Listing.find(params[:id])
    @listing.update_column("status","Approved")
    if @listing.save
      VendorMailer.listing_confirmation(@listing).deliver
      redirect_to '/adminactions/dashboard', :notice => "Success, Approved!"
    else
      redirect_to '/adminactions/dashboard', :notice => "Failure, NOT Approved!"
    end
  end
  
  def approvecomment
     @comment  = Comment.find(params[:id])
     @comment.update_column("status","Approved")
     if @comment.save
       redirect_to '/adminactions/dashboard', :notice => "Success, Approved!"
     else
       redirect_to '/adminactions/dashboard', :notice => "Failure, NOT Approved!"
     end
   end
  
  def dashboard
    @listings = Listing.find_all_by_status("Pending")
    @comments = Comment.find_all_by_status("Pending")
    
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
      VendorMailer.listing_modification(@listing).deliver
  end
  
 
end
