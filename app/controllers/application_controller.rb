# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    redirect_to login_url unless logged_in?
  end
end
