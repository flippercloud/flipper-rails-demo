class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    # Verify user exists and the password is correct
    if user && user.authenticate(params[:password])
      # Save the user.id in that user's session cookie
      session[:user_id] = user.id.to_s

      # Send them to the home page
      flash.notice = "You're in!"
      redirect_to root_path
    else
      # Otherwise, render login page with the alert
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # Remove the user id from the session so they're logged out
    session.delete(:user_id)

    # Send them to the login page
    redirect_to root_path, notice: "Logged out!"
  end
end
