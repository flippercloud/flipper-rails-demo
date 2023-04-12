class FeaturesController < ApplicationController
  include SessionsHelper

  before_action :verify_public_feature

  def create
    Rails.logger.info(feature_toggle_details)
    Flipper.enable(*feature_toggle_details)

    flash.notice = "Feature `#{feature}` is <mark>enabled</mark>!".html_safe
    redirect_to root_path
  end

  def destroy
    Rails.logger.info(feature_toggle_details)
    Flipper.disable(*feature_toggle_details)

    flash.notice = "Feature `#{feature}` is <mark>disabled</mark>!".html_safe
    redirect_to root_path
  end

  private

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
    %i[foo bar]
  end

  def verify_public_feature
    return if public_features.include?(feature)

    flash.alert = "Sorry, but that's not a valid public feature."
    redirect_to root_path and return
  end
end
