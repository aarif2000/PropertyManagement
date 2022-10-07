# frozen_string_literal: true

class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.string :amenity_name
      t.belongs_to :property

      t.timestamps
    end
  end
end
