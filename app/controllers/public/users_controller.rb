class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if current_user == @user
    else
      redirect_to user_path
    end
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def invalid
    user = current_user
    user.update(user_params)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :email, :is_deleted)
  end
  
end
