class ProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
   def index
     @profile = current_user.profiles.all
   end

   def new
     @profile = current_user.build_profile
   end

   def create
     @profile = current_user.build_profile(profile_params())
     if @profile.save
       redirect_to dashboard_url, :notice => "Congratulations, profile created Successfully."
     else
       redirect_to :back, :notice => "Alas, profile could not be created."
     end

   end

   def show
     @profile = Profile.find(params[:id])
     @user = User.find(@profile.id)
     @listings = Listing.where('user_id = ?',@profile.user_id).limit(50)
     @feedbacks = Review.where('profile_id = ?',@profile.user_id).limit(50)
     @review = @profile.reviews.build
   end

   def edit
     @profile = Profile.where('user_id = ?',current_user.id).first
   end

   def update
    
     @profile = Profile.where('user_id = ?',current_user.id).first
      if @profile.update(profile_params())
         redirect_to dashboard_url, :notice => "Congratulations, profile updated Successfully."
       else
         redirect_to :back, :notice => "Alas, profile could not be updated."
       end
       
    
       
   end

   def destroy
     @profile = profile.find(params[:id]).destroy
   end
   
   
    def vote_for_profile
        @profile = Profile.find(params[:id])
        current_user.vote_exclusively_for(@profile)
        respond_to do |format|
          format.js
        end
    end
    def vote_against_profile
         @profile = Profile.find(params[:id])
         current_user.vote_exclusively_against(@profile)
         respond_to do |format|
           format.js
         end
     end


     private 
     def profile_params
      params.require(:profile).permit(:fullname, :paypalemail, :displayname, :aboutme, :twitterhandle, :websiteurl, :country, :timezone, :location, :avatar, :address, :phone)
     end
 
end
