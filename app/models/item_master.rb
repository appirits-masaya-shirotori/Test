class ItemMaster < ApplicationRecord
    has_one :items, foreign_key: 'code', primary_key: 'code'
    
end
