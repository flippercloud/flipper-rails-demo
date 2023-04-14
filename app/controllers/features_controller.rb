class FeaturesController < ApplicationController
  include SessionsHelper

  before_action :verify_public_feature

  def create
    Rails.logger.info(feature_toggle_details)
    if percentage.present? && percentage > 0
      Flipper.enable_percentage_of_actors(*feature_toggle_details)
      session[:percentage] = percentage
    else
      Flipper.enable(*feature_toggle_details)
    end

    flash.notice = "The '#{feature.to_s.titleize}' feature is now enabled!".html_safe
    redirect_back_or_to redirect_target
  end

  def destroy
    Rails.logger.info(feature_toggle_details)
    if user.blank? && group.blank?
      Flipper.enable_percentage_of_actors(*feature_toggle_details)
      session[:percentage] = percentage
    else
      Flipper.disable(*feature_toggle_details)
    end

    flash.notice = "The '#{feature.to_s.titleize}' feature is now disabled!".html_safe
    redirect_back_or_to redirect_target
  end

  private

  def redirect_target
    params[:redirect] || root_path
  end

  def feature_toggle_details
    [feature, user, group, percentage].compact
  end

  def user
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

  def public_features
    %i[demo demo_basic demo_actor demo_group slow_roll]
  end

  def verify_public_feature
    return if public_features.include?(feature)

    flash.alert = "Sorry, but that's not a valid public feature."
    redirect_to root_path and return
  end
end
