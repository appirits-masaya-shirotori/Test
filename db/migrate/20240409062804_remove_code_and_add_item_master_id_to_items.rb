class RemoveCodeAndAddItemMasterIdToItems < ActiveRecord::Migration[7.1]
  def change
      remove_column :items, :code, :string
      add_column :items, :item_master_id, :integer
  end
end
