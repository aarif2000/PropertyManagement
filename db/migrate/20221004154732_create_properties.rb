class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name 
      t.string :address 
      t.integer :price 
      t.integer :beds 
      t.integer :bathrooms 
      t.integer :roomsize
      t.belongs_to :user

      t.timestamps
    end
  end
end
