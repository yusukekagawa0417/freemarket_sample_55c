class AddCustomerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :customer, :string, null: false
  end
end
