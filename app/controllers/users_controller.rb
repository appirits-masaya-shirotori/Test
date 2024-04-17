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
