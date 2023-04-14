class DemoController < ApplicationController
  # before_action :ensure_enabled

  def actor
  end

  def group
  end

  def percentage
  end

  private

  def required_feature
    "demo_#{action_name}".to_sym
  end

  def ensure_enabled
    return if Flipper.enabled?(required_feature, Current.user)

    flash.alert = "Sorry, but that feature is not enabled yet."
    redirect_to root_path and return
  end
end
