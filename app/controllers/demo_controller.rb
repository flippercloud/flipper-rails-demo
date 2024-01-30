class DemoController < ApplicationController
  # before_action :ensure_enabled

  def reset
    Current.user.update(beverage: 0) if Current.user.present?
    session[:percentage] = 0
    Flipper.disable_percentage_of_actors(:slow_roll)
    Flipper.disable_percentage_of_time(:slow_roll)
    Flipper.disable(:demo)
    Flipper.disable(:demo_actor)
    Flipper.disable(:demo_group)
    Flipper.disable(:slow_roll)

    sleep 1
    flash[:notice] = "The demo is reset and ready to go through again."
    redirect_to demo_start_path
  end

  def start
  end

  def actor
  end

  def group
    @water_drinker = User.water.first
    @tea_drinker = User.tea.first
    @coffee_drinker = User.coffee.first
  end

  def percentage
    @current_percentage = session[:percentage]&.to_i || 0
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
