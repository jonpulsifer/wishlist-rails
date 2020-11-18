# typed: false
# frozen_string_literal: true

class Family < ApplicationRecord
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :gift_users, through: :family_users, source: :user
  has_many :gifts, through: :gift_users
  validates :pin, presence: true, uniqueness: true

  def users_except(id)
    users.where.not(id: id)
  end
end
