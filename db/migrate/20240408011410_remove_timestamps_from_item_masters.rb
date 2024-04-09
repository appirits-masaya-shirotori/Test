class RemoveTimestampsFromItemMasters < ActiveRecord::Migration[7.1]
  def change
    remove_column :item_masters, :created_at, :datetime, null: false
    remove_column :item_masters, :updated_at, :datetime, null: false
  end
end
