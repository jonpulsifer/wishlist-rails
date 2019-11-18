class Gift < ApplicationRecord
    belongs_to :wishlist
    validates :name, presence: true

    def frozen?
        Date.today < Date.new(2019,12,01)
    end
end
