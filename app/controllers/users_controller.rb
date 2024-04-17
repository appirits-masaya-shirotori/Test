class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  
  # index アクション
  def index
    @users = User.all
  end
  
  # new アクション
  def new
    @user = User.new
  end
  
  # create アクション
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "ユーザーが登録されました。"
    else
      render :new
    end
  end
  
  # destroy アクション
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーが正常に削除されました。'
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to users_path, alert: "指定されたユーザーが見つかりません。"
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end



#<!--
#
#1. before_action :set_user
#  before_actionは特定のアクションが実行される前に特定のメソッド（この場合はset_user）を呼び出します。
#  only: [:destroy]はこのbefore_actionがdestroyアクションのみに適用されることを意味します。
#  set_userメソッドは、指定されたIDを持つユーザーをデータベースから検索し、@userインスタンス変数に格納します。ユーザーが見つからない場合は、ユーザーリストページにリダイレクトし、警告メッセージを表示します。
#
#2. index アクション
#  このアクションはすべてのユーザーを取得し、@usersインスタンス変数に格納します。
#  ビューではこの変数を使用して、登録されている全ユーザーのリストを表示できます。
#
#3. new アクション
#  新しいユーザーを作成するためのフォームを表示するために使用されます。
#  User.newは新しいUserオブジェクトを作成し、@userインスタンス変数に格納します。
#
#4. create アクション
#  フォームから送信されたデータを使用して新しいユーザーを作成します。
#  user_paramsメソッドを通じて、許可されたパラメータのみを取得します。
#  ユーザーの保存が成功した場合は、新しいユーザー登録フォームにリダイレクトし、成功メッセージを表示します。保存に失敗した場合は、再度登録フォームを表示します。
#
#5. destroy アクション
#  set_userメソッドによって設定された@userを削除します。
#  削除後はユーザーリストページにリダイレクトし、削除成功のメッセージを表示します。
#
#6. user_params メソッド
#  ストロングパラメータとして知られるこのメソッドは、セキュリティを強化するために使用されます。
#  ユーザーから受け取ることができるパラメータを:name, :email, :password, :password_confirmationに限定しています。
#
#-->
