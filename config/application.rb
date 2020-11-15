# typed: false
# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module WishlistApp
  class Application < Rails::Application
    config.load_defaults(6.0)
    config.action_dispatch.default_headers.merge!({
      'X-Frame-Options' => 'DENY',
      # 'Strict-Transport-Security' => 'max-age=631138519; includeSubdomains',
    })
  end
end
