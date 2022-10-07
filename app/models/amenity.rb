# frozen_string_literal: true

class Amenity < ApplicationRecord
  has_many :properties
end
