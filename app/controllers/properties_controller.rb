# frozen_string_literal: true
class PropertiesController < ApplicationController
  def index
   Pagy::DEFAULT[:items] = 1
   @pagy, @properties = pagy(Property.all.order(created_at: :desc))
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
    params.permit(:name, :city, :address, :property_type, :sharing, :price, :beds, :bathrooms, :avatar)
  end
end
