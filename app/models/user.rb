#<!--
#validates :name：nameというフィールドに対してバリデーションを設定しています。
#presence: true：このフィールドが空でないことを確認します。つまり、nameフィールドは必須であるということです。
#uniqueness: true：このフィールドの値がユニーク（一意）であることを確認します。つまり、同じnameの値を持つレコードが他に存在しない
#-->

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true

  has_many :Item
end
