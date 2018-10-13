class Gift < ApplicationRecord
    belongs_to :wishlist

    validates :url, presence: true
end
