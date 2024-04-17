class ItemMastersController < ApplicationController
  before_action :set_item_master, only: [:show, :destroy]

  # index アクション
  def index
    @item_masters = ItemMaster.all
  end

  # show アクション
  def show
  end

  # new アクション
  def new
    @item_master = ItemMaster.new
  end
  
  # create アクション
  def create
    item_master = ItemMaster.new(item_master_params)
    if item_master.save
      redirect_to item_masters_url, notice: 'アイテムマスターが正常に作成されました。'
    else
      render :new, alert: 'アイテムマスターの作成に失敗しました。'
    end
  end
  
  # destroy アクション
  def destroy
    @item_master.destroy
    redirect_to item_masters_url, notice: 'アイテムマスターが削除されました。'
  end
  
  private
  
  def set_item_master
    @item_master = ItemMaster.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "指定されたアイテムマスターが見つかりません。"
  end

  def item_master_params
    params.require(:item_master).permit(:name, :rank, :code)
  end
end
