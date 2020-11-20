# typed: false
# frozen_string_literal: true

class User < ApplicationRecord
  default_scope { order(name: :asc) }
  has_secure_password
  has_many :gifts, dependent: :destroy
  has_many :family_users, dependent: :destroy
  has_many :families, through: :family_users

  after_validation :normalize_name, on: [:create, :update]

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates_presence_of :families, message: 'not found, maybe the pin was wrong.'

  def claimed_gifts
    gifts.claimed
  end

  def available_gifts
    gifts.available
  end

  def naughty_or_nice_emoji
    gifts.available.count > 0 ? '😇' : '😈'
  end

  private

  def normalize_name
    self.name = name.downcase
  end
end
