class Item < ApplicationRecord
    belongs_to :user
    belongs_to :item_master
    # belongs_to :item_master, foreign_key: 'id', primary_key: 'id'
end
