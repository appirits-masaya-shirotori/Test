
class UsersController < ApplicationController
  #<!-- index -->
  def index
    @users = User.all
  end
  
  #<!-- new -->
  def new
    @user = User.new
  end
  
  #<!-- create -->
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: "ユーザーが登録されました。"
    else
      render :new
    end
  end
  #<!-- destroy -->
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'ユーザーが正常に削除されました。'
  end
  
  private
  
  #<!-- params -->
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

