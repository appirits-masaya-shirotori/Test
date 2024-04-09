class AddNameToItemMasters < ActiveRecord::Migration[7.1]
  def change
    add_column :item_masters, :name, :string
  end
end
