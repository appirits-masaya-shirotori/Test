class AddCodeAndQuantityToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :code, :string
    add_column :items, :quantity, :integer
  end
end
