class RemoveTitleDescriptionNameFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :title, :string
    remove_column :items, :description, :text
    remove_column :items, :name, :string
  end
end
