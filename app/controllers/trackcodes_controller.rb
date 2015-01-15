class TrackcodesController < ApplicationController
  before_filter :authenticate_user!

    def new
       @order = Order.find(params[:id])
       @trackcode = @order.build_trackcode
     end

     def create
       @order = Order.find(params[:trackcode][:order_id])
       @trackcode = @order.create_trackcode(trackcode_params())
       if @trackcode.save
         BuyerMailer.shipping_confirmation(@order,@trackcode).deliver
         redirect_to :dashboard, :notice => "Congratulations, trackcode created Successfully."
       else
         redirect_to :back, :notice => "Alas, trackcode could not be created."
       end
     end
     
       def show
            @trackcode = Trackcode.find(params[:id])
          end
     
     
     

      def edit
           @order = Order.find(params[:id])
           @trackcode = Trackcode.find_by_order_id(@order.id)
         end

         def update
           @order = Order.find(params[:trackcode][:order_id])
           @trackcode = @order.update_trackcode(trackcode_params())
           if @trackcode.save
             redirect_to :dashboard, :notice => "Congratulations, trackcode created Successfully."
           else
             redirect_to :back, :notice => "Alas, trackcode could not be created."
           end
         end
         
        


       private 
       def trackcode_params
        params.require(:trackcode).permit(:code,:order_id, :shipping_company, :shipping_city, :shippingto_city, :shipping_date)
       end
   end

