class ItemMastersController < ApplicationController
  def index
    @item_masters = ItemMaster.all
  end
  def new
    @item_master = ItemMaster.new
  end

  def create
    @item_master = ItemMaster.new(item_master_params)
    puts @item_master.inspect
    if @item_master.save
      redirect_to new_item_master_path, notice: 'アイテムが正常に登録されました。'
    else
      render :new
    end
  end
  
  private
  
  def item_master_params
      params.require(:item_master).permit(:name, :rank, :code)
  end
end
