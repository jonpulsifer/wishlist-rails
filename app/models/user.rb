# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :family_users
  has_many :families, through: :family_users
  has_many :gift_users
  has_many :gifts, through: :gift_users, dependent: :destroy

  after_validation :normalize_name, on: [:create, :update]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates_presence_of :families, message: 'not found, maybe the pin was wrong.'

  def claimed_gifts
    gifts.claimed
  end

  def unclaimed_gifts
    gifts.unclaimed
  end

  private

  def normalize_name
    self.name = name.downcase
  end
end
