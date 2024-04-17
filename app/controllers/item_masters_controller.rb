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

#<!--
#1. before_action :set_item_master
#  before_actionは特定のアクションが実行される前に特定のメソッド（この場合はset_item_master）を呼び出します。
#  only: [:show, :destroy]はこのbefore_actionがshowとdestroyアクションのみに適用されることを意味します。
#  set_item_masterメソッドは、指定されたIDを持つアイテムマスターをデータベースから検索し、@item_masterインスタンス変数に格納します。アイテムマスターが見つからない場合は、ルートパスにリダイレクトし、警告メッセージを表示します。
#
#2. index アクション
#  このアクションはすべてのアイテムマスターを取得し、@item_mastersインスタンス変数に格納します。
#  ビューではこの変数を使用して、登録されている全アイテムマスターのリストを表示できます。
#
#3. show アクション
#  特定のアイテムマスターの詳細を表示します。詳細はset_item_masterメソッドによって@item_masterに設定されています。
#
#4. new アクション
#  新しいアイテムマスターを作成するためのフォームを表示するために使用されます。
#  ItemMaster.newは新しいItemMasterオブジェクトを作成し、@item_masterインスタンス変数に格納します。
#
#5. create アクション
#  フォームから送信されたデータを使用して新しいアイテムマスターを作成します。
#  item_master_paramsメソッドを通じて、許可されたパラメータのみを取得します。
#
#-->
