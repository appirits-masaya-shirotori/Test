class ItemMastersController < ApplicationController
  #<!-- index -->
  def index
    @item_masters = ItemMaster.all
  end
  #<!-- show -->
  def show
    @item = Item.find(id: params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "指定されたアイテムマスターが見つかりません。"
  end
  
  #<!-- new -->
  def new
    @item_master = ItemMaster.new
  end
  
  
  #<!-- create -->
  def create
    @item_master = ItemMaster.new(item_master_params)
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "指定されたアイテムマスターが見つかりません。"
  end
  
  #<!-- destroy -->
  def destroy
    @item_master = ItemMaster.find(params[:id])
    @item_master.destroy
    redirect_to item_masters_url, notice: 'アイテムマスターが削除されました。'
  end
  
  
  private
  
  #<!-- params -->
  def item_master_params
    params.require(:item_master).permit(:id, :name, :rank, :code)
  end
end
