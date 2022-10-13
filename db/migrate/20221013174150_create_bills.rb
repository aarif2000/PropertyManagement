class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.integer   :rent_amount
      t.timestamps
    end
  end
end
