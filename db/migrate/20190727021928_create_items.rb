class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name, null: false, index: true
      t.text        :description
      t.integer     :condition
      t.integer     :shipping_fee
      t.integer     :shipping_date
      t.integer     :price, null: false
      t.references  :seller_id, foreign_key: { to_table: :users }
      t.integer     :status
      t.timestamps
    end
  end
end