class CloudController < ApplicationController
  def connect
    token = EncryptedToken.decrypt(params[:token])

    # Get flipper instance using the given token
    flipper = Flipper::Middleware::Session.configure(session, token: token)

    # Sync will fail on invalid tokens
    flipper.sync

    # Save the token in the session
    session[:cloud_token] = token

    redirect_back_or_to root_path, notice: "Connected to Flipper Cloud!"
  rescue EncryptedToken::Invalid, Flipper::Adapters::Http::Error
    render plain: "Invalid token", status: :not_acceptable
  end
end
