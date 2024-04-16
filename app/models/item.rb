class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_master

  before_save :merge_with_existing_item
  after_save :remove_if_zero_quantity
  delegate :id, :name, :description, to: :item_master, prefix: true

  private

  def merge_with_existing_item
    return unless new_record?

    Item.transaction do
      existing_item = Item.lock.find_by(user_id: user_id, item_master_id: item_master_id)
      if existing_item
        existing_item.increment!(:quantity, self.quantity)
        self.quantity = 0
      end
    end
  end

  def remove_if_zero_quantity
    self.destroy if self.quantity.zero?
  end
end
