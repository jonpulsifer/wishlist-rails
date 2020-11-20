# typed: false
# frozen_string_literal: true

class Family < ApplicationRecord
  default_scope { order(name: :asc) }
  has_many :family_users, dependent: :destroy
  has_many :users, through: :family_users
  has_many :gifts, through: :users
  validates :pin, presence: true, uniqueness: true

  def users_except(id)
    users.where.not(id: id)
  end
end
