# frozen_string_literal: true
require 'uri'

class Gift < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  scope :claimed, -> { where("claimed_by IS NOT NULL") }
  scope :unclaimed, -> { where("claimed_by IS NULL") }

  def frozen?
    Date.today < Date.new(2020, 12, 10)
  end
end
