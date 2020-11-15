# typed: false
# frozen_string_literal: true

class Gift < ApplicationRecord
  has_one :gift_user
  has_one :user, through: :gift_user

  validates :name, presence: true
  scope :claimed, -> { where("claimed_by IS NOT NULL") }
  scope :unclaimed, -> { where("claimed_by IS NULL") }
  scope :claimed_by_user, ->(user) { where("claimed_by = ? ", user) }

  def frozen?
    Date.today < Date.new(2020, 12, 20)
  end
end
