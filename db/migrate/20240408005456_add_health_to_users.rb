class AddHealthToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :health, :integer
  end
end
