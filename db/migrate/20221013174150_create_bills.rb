class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer   :rent_amount
      t.references :property 
      t.references :user 

      t.timestamps
    end
  end
end
