class AddRankToItemMasters < ActiveRecord::Migration[7.1]
  def change
    add_column :item_masters, :rank, :string
  end
end
