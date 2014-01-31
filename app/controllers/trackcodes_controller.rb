class TrackcodesController < ApplicationController
  before_filter :authenticate_vendor!

    def new
       @order = Order.find(params[:id])
       @trackcode = @order.trackcodes.new
     end

     def create
       @order = Order.find(params[:trackcode][:order_id])
       @trackcode = @order.trackcodes.create(trackcode_params())
       if @trackcode.save
         redirect_to :back, :notice => "Congratulations, trackcode created Successfully."
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
           @trackcode = @order.trackcodes.update_attributes(trackcode_params())
           if @trackcode.save
             redirect_to :back, :notice => "Congratulations, trackcode created Successfully."
           else
             redirect_to :back, :notice => "Alas, trackcode could not be created."
           end
         end
         
         
         def edit
              @order = Order.find(params[:id])
              @trackcode = Trackcode.find_by_order_id(@order.id)
            end




       private 
       def trackcode_params
        params.require(:trackcode).permit(:code,:order_id, :shipping_details)
       end
   end

