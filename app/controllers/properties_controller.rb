class PropertiesController < ApplicationController
    def index 
        @property=Property.all
    end

    def show 
        
    end
    def new
        @property = Property.new
    end
    def create 
        @property = Property.new(propertyparams)
        @property.save
        redirect_to root_path
    end

    private 

    def propertyparams
        params.require(:property).permit(:name,:address)
    end
end
