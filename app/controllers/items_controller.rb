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


#<!--
#
#1. before_action :set_item
#  before_actionは特定のアクションが実行される前に特定のメソッド（この場合はset_item）を呼び出します。
#  only: [:show, :destroy]はこのbefore_actionがshowとdestroyアクションのみに適用されることを意味します。
#  set_itemメソッドは、指定されたIDを持つアイテムをデータベースから検索し、@itemインスタンス変数に格納します。
#
#2. before_action :set_users
#  set_usersメソッドは、すべてのユーザーを名前順に取得し、@usersインスタンス変数に格納します。
#  only: [:index, :new]はこのbefore_actionがindexとnewアクションのみに適用されることを意味します。
#
#3. index アクション
#  特定のユーザーに関連付けられたアイテムを表示します。
#  @userは指定されたユーザーIDに基づいて検索されます。ユーザーが存在する場合、そのユーザーのアイテムが@itemsに格納されます。存在しない場合は空のリストが返されます。
#
#4. show アクション
#  特定のアイテムの詳細を表示します。詳細はset_itemメソッドによって@itemに設定されています。
#
#5. new アクション
#  新しいアイテムを作成するためのフォームを表示します。
#  Item.newで新しいItemオブジェクトを作成し、@itemに格納します。
#  ItemMasterの全データを名前順で取得し、@item_mastersに格納します。
#  build_item_masterメソッドを使用して、ItemMasterの関連オブジェクトを初期化します。
#
#6. create アクション
#  フォームから送信されたデータを基にアイテムを作成または更新します。
#  find_or_initialize_byメソッドを使用して、ユーザーIDとアイテムマスターIDに基づいてアイテムを検索し、存在しない場合は新しいインスタンスを初期化します。
#  アイテムが新規レコードの場合はcreate_new_itemを、既存の場合はupdate_existing_itemを呼び出します。
#
#7. destroy アクション
#  set_itemメソッドによって設定された@itemを削除します。
#  削除後はアイテムリストページにリダイレクトし、削除成功のメッセージを表示します。
#
#8. item_params メソッド
#  ストロングパラメータを使用して、許可されたパラメータのみを取得します。許可されているパラメータは:user_id, :item_master_id, :quantityです。
#
#-->
