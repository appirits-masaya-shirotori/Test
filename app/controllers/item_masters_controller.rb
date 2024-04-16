class ItemMastersController < ApplicationController
    #<!-- index -->
    def index
      @item_masters = ItemMaster.all
    end
    #<!-- show -->
    def show
      @item_master = ItemMaster.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "指定されたアイテムマスターが見つかりません。"
    end
    
    #<!-- new -->
    def new
      @item_master = ItemMaster.new
    end
    
    #<!-- edit -->
    #
    #
    #
    #<!-- create -->
    def create
      @item_master = ItemMaster.new(item_master_params)
      if @item_master.save
        redirect_to new_item_master_path, notice: 'アイテムが正常に登録されました。'
      else
        render :new
      end
    end
    
    private
    
    #<!-- params -->
    def item_master_params
      params.require(:item_master).permit(:id, :name, :rank, :code)
    end
end
