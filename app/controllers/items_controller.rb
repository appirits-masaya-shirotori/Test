class ItemsController < ApplicationController
    # index アクション
    def index
        if params[:user_id].present?
            @user = User.find_by(id: params[:user_id])
            @items = @user ? @user.items.includes(:item_master) : Item.none
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
        @item = Item.new(item_params)
        if @item.save
            redirect_to items_path, notice: 'アイテムが正常に作成されました。'
        else
            render :new
        end
    end

    # destroy アクション
    def destroy
        item = Item.find(params[:id])
        item.destroy
        redirect_to items_path, notice: 'アイテムが正常に削除されました。'
    end

    private

    def item_params
        params.require(:item).permit(:user_id, :item_master_id, :quantity)
    end
end
