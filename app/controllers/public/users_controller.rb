class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  def unsubscribe
  end
  
  def invalid
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email)
  end
  
end
