class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id 
      t.integer :transaction_id 
      t.datetime :checkin_date 
      t.datetime :checkout_date  
      t.timestamps
    end
  end
end
