# frozen_string_literal: true

class BookingsController < ApplicationController
    def index; end

    def new 
      @bookings = Booking.new
    end 
  
    def profile 
    end
  
    def payment 

    end 
  

    def confirm_booking 
      
    end
    
    def charge
        prop = Property.find_by(id: params[:id])
  
        check = true
        if check
          s = StripeService.new
          token = s.create_card_token(params)
          customer = s.find_or_create_customer(current_user)
          token= s.create_card_token(params)
          card=s.create_stripe_customer_card(token.id,customer)
          s.create_stripe_charge(prop.property_rent, customer.id, card.id, prop.name)
          s.book_property(prop,current_user,params[:booking_time])
          flash[:notice] = "Payment Succesfull!"
          redirect_to root_path(current_user.id)
          PropertyNotificationMailer.booking_notification(prop).deliver_now
        else
          redirect_to user_path(current_user.id), alert: "some error occured"
        end
    end
    
  end
  