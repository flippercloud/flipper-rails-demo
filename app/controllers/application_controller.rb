class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_current_user(attributes = {})
    # Save any attributes in the session to restore later
    session[:user] = attributes.with_defaults session[:user] || { name: "Current User" }

    # Set the current user to a new read-only instance, always id=0
    Current.user = User.new(**session[:user], id: 0).tap(&:readonly!)
  end
end
