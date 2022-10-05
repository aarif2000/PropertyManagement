class PropertiesController < ApplicationController
    def index 
        @properties=Property.all
    end 

    def show 
        @properties=Property.find(params[:id])
    end

    def new 
        @properties=Property.new 
    end

    def create 
        @properties=Property.new(propertyparams)
        @properties.user = current_user if user_signed_in?
        @properties.save 
        redirect_to root_path
    end
    def destroy
        @p = Property.find_by(id: params[:id])
        @p.destroy
        redirect_to root_path
    end
    private 

    def propertyparams 
        params.permit(:name,:description,:city, :address,:price,:beds,:bathrooms,:roomsize,:amenities1,:amenities2,:amenities3)
    end
end
