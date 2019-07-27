class RenameColumnSellerId < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :seller_id, foreign_key: { to_table: :users }
    add_reference :items, :seller, foreign_key: { to_table: :users }
  end
end