module SessionsHelper
  def current_user
    @current_user ||= Current.user
  end
end
