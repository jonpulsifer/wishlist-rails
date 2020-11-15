# typed: false
# frozen_string_literal: true
class GiftUser < ApplicationRecord
  belongs_to :gift
  belongs_to :user
end
