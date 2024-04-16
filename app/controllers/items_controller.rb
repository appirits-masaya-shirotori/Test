class ItemsController < ApplicationController
  def new
    @item = Item.new
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    puts @item.inspect
    if @item.save
        redirect_to new_item_path, notice: 'アイテムが正常に作成されました。'
    else
      render :new
    end
  end
  
  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :item_master_id, :quantity)
  end
end
