class CreateWishlistApp < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :shirt_size
      t.string :pant_size
      t.string :shoe_size
      t.string :fav_color
      t.boolean :plus_one

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
      t.integer :purchased_by
      t.integer :spoken_for_by
      t.belongs_to :wishlist, index: true
      t.timestamps
    end
  end
end
