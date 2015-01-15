class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  
 
  def new
    @listing = Listing.find(params[:id])
    @comment = @listing.comments.new
  end

  def create
    @listing = Listing.find(params[:comment][:listing_id])
    
    @comment = @listing.comments.create(comment_params())
    if @comment.save
      redirect_to :back, :notice => "Congratulations, comment created Successfully. It is pending approval. If it is appropriate it will be published soon."
    else
      redirect_to :back, :notice => "Alas, comment could not be created."
    end
  end


 
  
  
    private 
    def comment_params
     params.require(:comment).permit(:commentbody,:user_id,:listing_id, :status, :picture)
    end
end
