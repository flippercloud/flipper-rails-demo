class FeaturesController < ApplicationController
  include SessionsHelper

  before_action :verify_public_feature

  def create
    if percentage.present? && percentage > 0
      Flipper.enable_percentage_of_actors(feature, percentage)
      session[:percentage] = percentage
      audience = "about #{percentage}% of users"
    elsif group.present?
      Flipper.enable_group(feature, group)
      audience = group.to_s.humanize.pluralize.titleize
    elsif user.present?
      Flipper.enable_actor(feature, user)
      audience = user.email
    else
      Flipper.enable(feature)
    end

    flash.notice = "The <strong>'#{feature.to_s.titleize}'</strong> feature is now <strong>enabled</strong> for #{audience || 'everyone'}!".html_safe
    redirect_back_or_to redirect_target
  end

  def destroy
    if percentage.present?
      # When disabling percentages of actors, there's no need to pass a percent
      # value because it's assumed to be 0.
      Flipper.disable_percentage_of_actors(feature)
      session[:percentage] = 0
    elsif group.present?
      Flipper.disable_group(feature, group)
      audience = group.to_s.humanize.pluralize.titleize
    elsif user.present?
      # The demo focuses on users here, but in practice, this can be any "actor"
      # An "Actor" is any model that provides a unique `flipper_id` for each
      # instance. That could be any ActiveRecord model, any object that responds
      # to both `class` and `id`, or a model where you define a `flipper_id`
      # method that always returns a consistent and unique value.
      Flipper.disable_actor(feature, user)
      audience = user.email
    else
      Flipper.disable(feature)
      session[:percentage] = 0
    end

    flash.notice = "The <strong>'#{feature.to_s.titleize}'</strong> feature is now <strong>disabled</strong> for #{audience || 'everyone'}.".html_safe
    redirect_back_or_to redirect_target
  end

  private

  def redirect_target
    params[:redirect] || root_path
  end

  def user
    # Only updating a feature for a user when explicitly doing so
    params.fetch(:user, false) == 'true' ? Current.user : nil
  end

  def group
    params[:group]&.to_sym
  end

  def percentage
    params[:percentage]&.to_i
  end

  def feature
    params.require(:feature).to_sym
  end

  def verify_public_feature
    return if Flipper.features.map { |feature| feature.key.to_sym }.include?(feature)

    flash.alert = "Sorry, but that's not a valid public feature."
    redirect_to root_path and return
  end
end
