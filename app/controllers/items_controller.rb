# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  def index
    @current_user = User.first
    @items = @current_user.items
  end
end
