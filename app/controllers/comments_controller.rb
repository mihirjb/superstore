class CommentsController < ApplicationController
  before_filter :deny_to_visitor, :except => [:show]
  
 
  def new
    @listing = Listing.find(params[:id])
    @comment = @listing.comments.new
  end

  def create
    @listing = Listing.find(params[:comment][:listing_id])
    @comment = @listing.comments.create(comment_params())
    if @comment.save
      redirect_to :back, :notice => "Congratulations, comment created Successfully."
    else
      redirect_to :back, :notice => "Alas, comment could not be created."
    end
  end


 
  
  
    private 
    def comment_params
     params.require(:comment).permit(:commentbody,:vendor_id)
    end
end
