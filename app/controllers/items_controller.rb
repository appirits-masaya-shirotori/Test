class ItemsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @items = @user.items
    else
      @items = Item.all
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path, notice: "アイテムが登録されました。"
    else
      render :new
    end
  end

  def select_user
    redirect_to items_path(user_id: params[:user_id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :user_id)
  end
  def select_user
      # フォームから送信されたユーザーIDを使用してリダイレクト
      redirect_to items_path(user_id: params[:user_id])
    end
end
