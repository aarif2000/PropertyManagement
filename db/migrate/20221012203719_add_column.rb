class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :property_id, :integer
  end
end
