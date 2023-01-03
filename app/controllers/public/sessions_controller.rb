# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def user_state
    #userのデータ内に同じメールアドレスがあるか確認.
    @user = User.find_by(email: params[:user][:email])
    #なければ処理終了
    return if !@customer
    #メールアドレスがあった場合パスワードが同じかつ退会しているか確認.
    if @customer.valid_password?(params[:user][:password]) && @user.is_deleted
      #パスワードが同じかつ退会済みの場合
      redirect_to new_user_registration_path
    else
      #上記以外の場合は処理なし
    end
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
