# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def profile 
  end

  def payment 
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
      s.book_property(prop,current_user)
      flash[:notice] = "Your card has been paid!, transaction successful"
      redirect_to root_path(current_user.id)
    else
      redirect_to user_path(current_user.id), alert: "some error occured"
    end
  end
  
end
