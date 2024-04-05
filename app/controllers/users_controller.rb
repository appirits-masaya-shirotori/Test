
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_item_path, notice: "ユーザーが登録されました。"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end

#class UsersController < ApplicationController
#  def new
#    @user = User.new
#  end
#
#  def create
#    @user = User.new(user_params)
#    if @user.save
#      redirect_to new_item_path, notice: "ユーザーが登録されました。"
#    else
#      render :new
#    end
#  end
#
#  private
#
#  def user_params
#    params.require(:user).permit(:name)
#  end
#end
