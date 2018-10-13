class User < ApplicationRecord
    has_secure_password
    has_one :wishlist, dependent: :destroy
    has_many :gifts, through: :wishlist

    validates :name, presence: true, uniqueness: true

    def has_wishlist?
        self.wishlist.present?
    end

    def profile_complete?
        self.shirt_size? && \
        self.pant_size? && \
        self.shoe_size? && \
        self.fav_color?
    end

    def no_chores?
        self.gifts.any? && \
        self.wishlist.present? && \
        self.profile_complete?
    end
end
