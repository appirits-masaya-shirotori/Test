class AddNameCodeToItemMasters < ActiveRecord::Migration[7.1]
  def change
    add_column :item_masters, :code, :string
  end
end
