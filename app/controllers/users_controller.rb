class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path(@user), notice: 'プロフィールが更新されました。'
    else
      flash.now[:alert] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:icon_image, :name, :self_introduction)
  end
end
