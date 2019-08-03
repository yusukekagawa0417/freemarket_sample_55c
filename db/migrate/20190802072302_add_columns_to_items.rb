class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :brand, foreign_key: true
    add_reference :items, :category, foreigh_key: true
    add_column :items, :shipping_method, :integer, null: false
  end
end