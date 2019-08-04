class AddCardToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card, :string, null: false
  end
end
