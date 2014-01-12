class ReviewsController < ApplicationController
  before_filter :authenticate_vendor!
 
   def new
      @profile = Profile.find(params[:id])
      @review = @profile.reviews.new
    end

    def create
      @profile = Profile.find(params[:review][:profile_id])
      @review = @profile.reviews.create(review_params())
      if @review.save
        redirect_to :back, :notice => "Congratulations, review created Successfully."
      else
        redirect_to :back, :notice => "Alas, review could not be created."
      end
    end





      private 
      def review_params
       params.require(:review).permit(:reviewbody,:author_id, :thumbsup)
      end
  end
  