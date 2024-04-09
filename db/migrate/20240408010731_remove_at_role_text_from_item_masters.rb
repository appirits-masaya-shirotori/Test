class RemoveAtRoleTextFromItemMasters < ActiveRecord::Migration[7.1]
  def change
    remove_column :item_masters, :AT, :integer
    remove_column :item_masters, :Role, :string
    remove_column :item_masters, :text, :text
  end
end
