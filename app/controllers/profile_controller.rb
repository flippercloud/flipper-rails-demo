class ProfileController < ApplicationController
  def update
    set_current_user user_params
    flash.notice = "Your profile has been updated!"
    redirect_back_or_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :beverage)
  end
end
