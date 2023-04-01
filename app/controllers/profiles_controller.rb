class ProfilesController < ApplicationController
  def update
    if current_user.update(user_params)
      redirect_to edit_profile_path, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :self_introduction, :icon_image)
  end
end
