class ProfilesController < ApplicationController
  before_filter :authenticate_vendor!, :except => [:show]
   def index
     @profile = current_vendor.profiles.all
   end

   def new
     @profile = current_vendor.build_profile
   end

   def create
     @profile = current_vendor.build_profile(profile_params())
     if @profile.save
       redirect_to dashboard_url, :notice => "Congratulations, profile created Successfully."
     else
       redirect_to :back, :notice => "Alas, profile could not be created."
     end

   end

   def show
     @profile = Profile.find(params[:id])
     @listings = Listing.find_all_by_vendor_id(@profile.vendor_id, :limit => 50)
     @feedbacks = Review.find_all_by_profile_id(@profile.id, :limit => 50)
     @review = @profile.reviews.build
   end

   def edit
     @profile = Profile.find(current_vendor.id)

   end

   def update
    
     @profile = Profile.find(current_vendor.id)
      
      if profile.update(profile_params())
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
        current_vendor.vote_exclusively_for(@profile)
        respond_to do |format|
          format.js
        end
    end
    def vote_against_profile
         @profile = Profile.find(params[:id])
         current_vendor.vote_exclusively_against(@profile)
         respond_to do |format|
           format.js
         end
     end


     private 
     def profile_params
      params.require(:profile).permit(:fullname, :paypalemail, :displayname, :aboutme, :twitterhandle, :websiteurl, :country, :timezone, :location, :avatar, :address, :phone)
     end
 
end
