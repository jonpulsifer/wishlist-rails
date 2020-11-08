# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :exception
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      flash[:error] = "Please sign in to continue"
      redirect_to login_url
    end
  end
end
