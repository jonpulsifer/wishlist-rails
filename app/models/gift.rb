# typed: false
# frozen_string_literal: true

class Gift < ApplicationRecord
  belongs_to :user
  has_many :families, through: :user
  default_scope { order(name: :asc) }

  validates :name, presence: true

  scope :available, -> { where("claimed_by IS NULL") }
  scope :claimed, -> { where("claimed_by IS NOT NULL") }
  scope :claimed_by_user, ->(user) { where("claimed_by = ? ", user) }
  scope :visible, ->(user) { where(claimed_by: user.id).or(where(claimed_by: nil)) }

  def frozen?
    Date.today < Date.new(2020, 12, 20)
  end
end
