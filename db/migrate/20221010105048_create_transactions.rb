class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.float :amount 
      t.integer :user_id
      t.integer :owner_id 

      t.timestamps
    end
  end
end
