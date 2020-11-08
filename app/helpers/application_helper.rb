# frozen_string_literal: true

module ApplicationHelper
  def flash_messages
    if flash.count > 0
      render 'flash', flash: flash
    end
  end
end
