# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def switch_user
    session[:user_id] = params[:user_id]
    redirect_to items_path # またはユーザーを切り替えた後に表示したい任意のパス
  end
end


