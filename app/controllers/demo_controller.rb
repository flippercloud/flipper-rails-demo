class DemoController < ApplicationController
  def reset
    Flipper.features.each(&:disable)
    Flipper.disable_percentage_of_actors(:slow_roll)
    Flipper.disable_percentage_of_time(:slow_roll)
    reset_session

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
end
