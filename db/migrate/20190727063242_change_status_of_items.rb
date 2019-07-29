class ChangeStatusOfItems < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :items, :status, :integer, default: 0
    end
    
    def down
      change_column :items, :status, :integer
    end
  end
end
