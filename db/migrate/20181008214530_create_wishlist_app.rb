class CreateWishlistApp < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    create_table :wishlists do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.timestamps
    end

    create_table :gifts do |t|
      t.string :name
      t.string :url
      t.text :notes
      t.integer :claimed_by
      t.belongs_to :wishlist, index: true
      t.timestamps
    end
  end
end
