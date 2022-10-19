class BillController < ApplicationController

        def index

            @bill=Bill.all
            
        end

        def show

        @bill = Bill.find(params[:id]) 

        end

        def new
            # @bill= Bill.new
        end


        def create
            @bill = Bill.new(billparams)
            @prop = Property.find(params[:property_id])
            @bill.property = @prop
            @bill.user = @prop.tenants.first
            if @bill.save
                PropertyNotificationMailer.bill_notification(@bill).deliver_now 
            flash[:notice]= "Bill Created"
            redirect_to root_path
            end 
         end

        private

        def billparams
            params.permit(:rent_amount)
        end
end
