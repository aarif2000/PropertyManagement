# frozen_string_literal: true
class PropertiesController < ApplicationController
  def index
    authorize! :index, :property
    @q = Property.where(status: 'unbooked').ransack(params[:q])
    @properties= @q.result(distinct: true)
    @pagy, @properties = pagy(@properties.order(created_at: :desc))
    @properties = current_user.properties.all if current_user.role == 'Owner'
  end

  def show
    authorize! :show, :property 

    @properties = Property.find(params[:id])
  end

  def new
    authorize! :manage, :property
    @properties = Property.new
  end

  
  def create
    @properties = Property.new(propertyparams)
    @properties.user = current_user if user_signed_in?

    if @properties.save
      PropertyNotificationMailer.create_notification(@properties).deliver_now 
    flash[:notice]= "Successfully Created Property"
    else 
      flash[:alert] = @properties.errors.full_messages
    end
    redirect_to root_path
  end

  def update
   if  @property = Property.find(params[:id]).update(propertyparams)
    flash[:notice]= "Successfully Updated Property"
   else 
    flash[:alert]= "Some Error ocurred"
   end
    redirect_to root_path
    
  end

  def destroy
    @properties = Property.find_by(id: params[:id])
    @properties.destroy
    PropertyNotificationMailer.delete_notification(@properties).deliver_now 
    flash[:alert]= "Successfully Deleted  Property"
    
    redirect_to root_path
  end

  def current_property
        
  end

  def update_status 
    @properties = Property.find(params[:id])
    @properties.update(status: "unbooked")
    @properties.update(sharing: "double")
    redirect_to root_path
  end


  def share 
    @share = Property.find(params[:id])
    
  end

  
  
  private

  def propertyparams
    params.permit(:name, :city, :address, :property_type,
       :sharing, :property_rent, :bedrooms,
       :bathrooms,:amenities_1,:amenities_2,:amenities_3,:protocol_1, :protocol_2, :avatar =>[])
  end
end
