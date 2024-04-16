class ItemsController < ApplicationController

    def select_user
    end
    #<!-- index -->
    def index
      if params[:user_id].present?
        @user = User.find_by(id: params[:user_id])
        @items = Item.includes(:user, :item_master).where(user_id: params[:user_id])
      else
        @items = Item.includes(:user, :item_master).all
      end
    end
    
    #<!-- new -->
    def new
        @item = Item.new
        @items = Item.all
    end
    
    #<!-- create -->
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to new_item_path, notice: 'アイテムが正常に作成されました。'
      else
        render :new
      end
    end

    private
    def item_params
      params.require(:item).permit(:user_id, :item_master_id, :quantity)
    end
  end
  
