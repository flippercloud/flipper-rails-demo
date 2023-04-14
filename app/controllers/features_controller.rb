class FeaturesController < ApplicationController
  include SessionsHelper

  before_action :verify_public_feature

  def create
    Rails.logger.info(feature_toggle_details)
    Flipper.enable(*feature_toggle_details)

    flash.notice = "The '#{feature.to_s.titleize}' feature is now enabled!".html_safe
    redirect_back_or_to redirect_target
  end

  def destroy
    Rails.logger.info(feature_toggle_details)
    Flipper.disable(*feature_toggle_details)

    flash.notice = "The '#{feature.to_s.titleize}' feature is now disabled!".html_safe
    redirect_back_or_to redirect_target
  end

  private

  def redirect_target
    params[:redirect] || root_path
  end

  def feature_toggle_details
    [feature, user].compact
  end

  def user
    Rails.logger.info params.fetch(:user, false)
    params.fetch(:user, false) == 'true' ? Current.user : nil
  end

  def feature
    params.require(:feature).to_sym
  end

  def public_features
    %i[demo demo_basic demo_actor demo_group demo_percentage]
  end

  def verify_public_feature
    return if public_features.include?(feature)

    flash.alert = "Sorry, but that's not a valid public feature."
    redirect_to root_path and return
  end
end
