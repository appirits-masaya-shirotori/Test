class ItemMaster < ApplicationRecord
    has_many :items, foreign_key: 'code', primary_key: 'code'
    
end
