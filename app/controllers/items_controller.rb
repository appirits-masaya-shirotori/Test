class ItemsController < ApplicationController
  # index アクション
  def index
    if params[:user_id].present?
      begin
        @user = User.find(params[:user_id])
        @items = @user.items.includes(:item_master)
        rescue ActiveRecord::RecordNotFound
        @items = Item.none
        flash[:alert] = '指定されたユーザーが見つかりません。'
      end
    else
      @items = Item.includes(:user, :item_master).all
    end
  end
  
  # new アクション
  def new
    @item = Item.new
  end
  
  # create アクション
  def create
    existing_item = Item.find_by(user_id: item_params[:user_id], item_master_id: item_params[:item_master_id])
    if existing_item.nil?
      @item = Item.new(item_params)
      if @item.save
        redirect_to items_path, notice: 'アイテムが正常に作成。'
      else
        render :new
      end
    else
      # 既存のアイテムが見つかった場合は、数量を加算して更新
      new_quantity = existing_item.quantity + item_params[:quantity].to_i
      if existing_item.update(quantity: new_quantity)
        redirect_to items_path, notice: '既存のアイテムの数量が更新'
      else
        render :new, alert: '数量の更新に失敗'
      end
    end
  end
  
  # destroy アクション
  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy
      redirect_to items_path, notice: 'アイテムが正常に削除されました。'
      rescue ActiveRecord::RecordNotFound
      redirect_to items_path, alert: '指定されたアイテムが見つかりません。'
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:user_id, :item_master_id, :quantity)
  end
end
