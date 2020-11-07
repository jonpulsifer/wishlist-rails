# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :family, optional: true
  has_many :gifts, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
