
class UsersController < ApplicationController
    #<!-- index -->
    def index
        @users = User.all
    end
    
    #<!--show -->
    #
    #
    
    #<!-- new -->
    def new
        @user = User.new
    end
    
    #<!-- edit -->
    #
    #
    #

    #<!-- create -->
    def create
        @user = User.new(user_params)
        # puts @user.inspect
        if @user.save
            redirect_to new_user_path, notice: "ユーザーが登録されました。"
        else
            render :new
        end
    end
  #<!-- updata -->
  #
  #
  #
  
  
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

