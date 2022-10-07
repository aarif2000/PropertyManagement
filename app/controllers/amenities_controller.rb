# frozen_string_literal: true

class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.all
  end

  def new
    @amenities = Amenity.new
  end
end
