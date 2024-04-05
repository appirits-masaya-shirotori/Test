# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# ユーザーデータの作成
user1 = User.create!(name: "山田太郎")
user2 = User.create!(name: "鈴木一郎")

# Itemデータの作成
Item.create!(name: "アイテム1", user: user1)
Item.create!(name: "アイテム2", user: user1)
Item.create!(name: "アイテム3", user: user2)
