class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_master
  delegate :id, :name, :rank, to: :item_master, prefix: true
end
