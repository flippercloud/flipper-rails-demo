class CloudController < ApplicationController
  def connect
    # Get flipper instance using the given token
    flipper = Flipper::Middleware::Session.configure(session, token: params[:token])

    # Sync will fail on invalid tokens
    flipper.sync

    # Save the token in the session
    session[:cloud_token] = params[:token]

    redirect_back_or_to root_path, notice: "Connected to Flipper Cloud!"
  rescue Flipper::Adapters::Http::Error
    render plain: "Invalid token", status: :not_acceptable
  end
end
