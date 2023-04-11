class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # Save the user.id in that user's session cookie
      session[:user_id] = @user.id.to_s

      # Send them to the home page
      flash.notice = "Welcome to the Flipper demo!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
