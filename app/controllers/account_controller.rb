class AccountController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to account_path, notice: 'アカウント情報が更新されました。'
    else
      flash.now[:alert] = 'アカウント情報の更新に失敗しました。'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
