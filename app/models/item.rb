class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item_master
  delegate :id, :name, :rank, :code, to: :item_master, prefix: true
end
