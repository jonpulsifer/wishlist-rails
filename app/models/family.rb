# frozen_string_literal: true

class Family < ApplicationRecord
  has_many :users
  has_many :gifts, through: :users
end
