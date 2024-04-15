class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_master

  before_create :merge_with_existing_item
  after_save :remove_if_zero_quantity

  private

  def merge_with_existing_item
    existing_item = Item.find_by(user_id: user_id, item_master_id: item_master_id)
    if existing_item
      existing_item.quantity += self.quantity
      existing_item.save
      self.quantity = 0 # このアイテムの数量を0に設定して保存を防ぐ
    end
  end

  def remove_if_zero_quantity
    self.destroy if self.quantity.zero?
  end
end
