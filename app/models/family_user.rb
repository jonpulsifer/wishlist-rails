# typed: false
# frozen_string_literal: true
class FamilyUser < ApplicationRecord
  belongs_to :family
  belongs_to :user
end
