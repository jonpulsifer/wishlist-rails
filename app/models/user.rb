class User < ApplicationRecord
    has_secure_password
    has_one :wishlist, dependent: :destroy
    has_many :gifts, through: :wishlist
    validates :name, presence: true, uniqueness: true

    def has_wishlist?
        self.wishlist.present?
    end
end
