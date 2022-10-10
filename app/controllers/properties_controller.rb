# frozen_string_literal: true
class PropertiesController < ApplicationController
  def index
    @search = Property.ransack(params[:search])
    @properties= @search.result(distinct: true)
   @pagy, @properties = pagy(@properties.order(created_at: :desc))
  end

  def show
    @properties = Property.find(params[:id])
  end

  def new
    @properties = Property.new
  end

  def create
    @properties = Property.new(propertyparams)
    @properties.user = current_user if user_signed_in?
    @properties.save
    redirect_to root_path
  end

  def update
    @property = Property.find(params[:id]).update(propertyparams)
    redirect_to root_path

  end

  def destroy
    @properties = Property.find_by(id: params[:id])
    @properties.destroy
    redirect_to root_path
  end

  private

  def propertyparams
    params.permit(:name, :city, :address, :property_type, :sharing, :price, :beds, :bathrooms,:amenities_1,:amenities_2,:amenities_3, :avatar =>[])
  end
end
