# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :city
      t.string :address
      t.string :property_type
      t.string :sharing
      t.string :amenities_1
      t.string :amenities_2
      t.string :amenities_3
      t.integer :price
      t.integer :beds
      t.integer :bathrooms
      t.belongs_to :user

      t.timestamps
    end
  end
end
