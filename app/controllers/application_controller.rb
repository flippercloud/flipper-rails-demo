class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def test_login
    render body: "hello #{params[:login]}"
  end
end
