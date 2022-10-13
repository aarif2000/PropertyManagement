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
            @bill.save
            flash[:notice]= "Bill Created"
            redirect_to root_path
        end
        private
        def billparams
            params.permit(:rent_amount)
        end
end
