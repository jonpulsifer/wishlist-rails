# typed: false
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  include SessionsHelper

  helper_method :current_user
  helper_method :logged_in?

  private

  def require_login
    puts "_--_______---PARAMS"
    puts params[:controller].to_s

    unless logged_in? || params[:controller].to_s.match(/^quilt/)
      redirect_to(login_url)
    end
  end
end
