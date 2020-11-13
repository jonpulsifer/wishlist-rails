# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :family
  has_many :gifts, dependent: :destroy

  before_validation :normalize_name, on: :create

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private

  def normalize_name
    self.name = name.downcase
  end
end
