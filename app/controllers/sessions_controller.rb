## app/controllers/sessions_controller.rb
#class SessionsController < ApplicationController
#  def switch_user
#    # パラメーターからユーザーIDを取得
#    user_id = params[:user_id]
#    
#    # 指定されたIDに対応するユーザーを検索
#    user = User.find_by(id: user_id)
#    
#    if user
#      # ユーザーが見つかった場合、セッションにユーザーIDを保存
#      session[:user_id] = user.id
#      flash[:notice] = "#{user.name} に切り替えました。"
#    else
#      # ユーザーが見つからなかった場合のエラーメッセージ
#      flash[:alert] = "指定されたユーザーが見つかりません。"
#    end
#    
#    # 操作後は元のページか、またはデフォルトのページにリダイレクト
#    redirect_back(fallback_location: root_path)
#  end
#end
class SessionsController < ApplicationController
  def switch_user
    session[:user_id] = params[:user_id]
    redirect_to items_path # またはユーザーを切り替えた後に表示したい任意のパス
  end
end


