# typed: false
# frozen_string_literal: true

class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :gift_users
  has_many :gifts, through: :gift_users, source: :user
  validates :pin, presence: true, uniqueness: true

  def users_except(id)
    users.where.not(id: id)
  end
end
