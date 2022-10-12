class BookingsController < ApplicationController
   def index
       #@hostel = Hostel.find(params[:hostel_id])
       @booking = current_user.bookings.order(created_at: :desc)
   end

   def new
    @booking = Booking.new
   end

   def create                 
       @properties = Property.find(params[:property_id])
       @booking = @property.bookings.new(booking_params)
       booking_room = booking_params[:no_of_rooms].to_i
       booked = Booking.where(property_id: @property).sum(:no_of_rooms)
       available_rooms = @hostel.no_of_rooms - booked
       if available_rooms >= booking_room
           @booking.save 
       else
           redirect_to :back, :alert => '* Number of rooms you want to book are not available'
       end
       @booked = Booking.where(hostel_id: @hostel).sum(:no_of_rooms)
       @hostel.available_rooms = @property.no_of_rooms - @booked
       @hostel.save
   end

   def show
       @booking = Property.find(params[:property_id])
   end

   def confirm_booking
       @booking = Booking.find(params[:id])
       if @booking.update(confirm: true)
           UserMailer.welcome_booking_email(current_user).deliver
       end
       redirect_to root_path
   end

   def destroy
       hostel= Hostel.find(@booking.hostel_id)
       @booking.destroy
       booked = Booking.where(hostel_id: @booking.hostel_id).sum(:no_of_rooms)
       hostel.available_rooms = hostel.no_of_rooms - booked
       hostel.save
       redirect_to :back
   end

   def check_booking_availability
       @hostel = Hostel.find(params[:hostel_id])
       @booked = Booking.where(hostel_id: @hostel).sum(:no_of_rooms)
       @hostel_available_rooms = @hostel.no_of_rooms - @booked
       @Booking_room = params[:no_of_rooms]
       render json: [@hostel_available_rooms,@Booking_room]
   end

   def admin_booking_status
       @hostels = current_user.property 
   end

   def booking_checkout
    redirect_to root_path 
      
   end

   def cancel_url
    
   end

   def ipn_url
   end

   def return_url
       
   end
   
   def create_booking
       @booking = Booking.new({:no_of_rooms => session[:rooms], :checkin_date => session[:checkin_date], :checkout_date => session[:checkout_date], :user_id => current_user.id, :property_id => session[:property_id]})
       @booking.save
       @hostel = Booking.find(session[:property_id])
       @booked = Booking.where(:property_id => session[:property_id]).sum(:no_of_rooms)
       @hostel.available_rooms = @properties.no_of_rooms - @booked
       @hostel.save
   end

   def create_transaction(amount, receiver_pay_email, owner_id, transaction_status, paykey, transaction_id)
      
   end

   def create_subscription(t_id)
       @subscription = Subscription.new({:user_id => current_user.id, :transaction_id => t_id, :checkin_date => session[:checkin_date], :checkout_date => session[:checkout_date] })
       @subscription.save
       sub_id = @subscription.id
       booking_update = Booking.last
       booking_update.subscription_id = sub_id
       booking_update.save
   end

   def subscription_index
       @subscriptions = current_user.subscriptions
   end

   private
   
    def booking_params
     params.require(:booking).permit(:checkin_date, :checkout_date, :no_of_rooms).merge({user_id:current_user.id})
    end

    
end