class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id 
      t.integer :property_id 
      t.datetime :checkin_date 
      t.datetime :checkout_date 

      t.timestamps
    end
  end
end
