class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end
    # ユーザーが見つからなかった場合の処理も適宜追加してください
  end
end
