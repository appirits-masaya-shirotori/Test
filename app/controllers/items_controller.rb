class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  before_action :set_users, only: [:index, :new]

  # index アクション
  def index
    @user = User.find_by(id: params[:user_id])
    @items = @user ? @user.items.includes(:item_master) : Item.none
  end

  # show アクション
  def show
  end

  # new アクション
  def new
    @item = Item.new
    @item_masters = ItemMaster.all.order(:name)
    @item.build_item_master
  end
  
  # create アクション
  def create
    item = Item.find_or_initialize_by(user_id: item_params[:user_id], item_master_id: item_params[:item_master_id])
    
    if item.new_record?
      create_new_item(item)
    else
      update_existing_item(item)
    end
  end
  
  # destroy アクション
  def destroy
    @item.destroy
    redirect_to items_path, notice: 'アイテムが正常に削除されました。'
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, alert: '指定されたアイテムが見つかりません。'
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_users
    @users = User.all.order(:name)
  end

  def item_params
    params.require(:item).permit(:user_id, :item_master_id, :quantity)
  end

  def create_new_item(item)
    item.quantity = item_params[:quantity].to_i  # quantity を設定
    if item.save
      redirect_to items_path, notice: 'アイテムが正常に作成されました。'
    else
      render :new
    end
  end

  def update_existing_item(item)
    new_quantity = item.quantity + item_params[:quantity].to_i
    if item.update(quantity: new_quantity)
      redirect_to items_path, notice: '既存のアイテムの数量が更新されました。'
    else
      render :new, alert: '数量の更新に失敗しました。'
    end
  end
end
