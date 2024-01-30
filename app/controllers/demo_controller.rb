class DemoController < ApplicationController
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
