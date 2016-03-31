class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to '/users/sign_in', alert: 'ユーザの新規作成はできません。'
  end

  def create
    redirect_to '/users/sign_in', alert: 'ユーザの新規作成はできません。'
  end

  private
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end