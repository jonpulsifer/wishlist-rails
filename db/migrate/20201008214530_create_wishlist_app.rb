# frozen_string_literal: true

class CreateWishlistApp < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      t.string(:name, null: false)
      t.string(:password_digest, null: false)
      t.text(:address)
      t.string(:shirt_size)
      t.string(:pant_size)
      t.string(:shoe_size)
      t.string(:dress_size)
      t.timestamps
    end

    create_table(:gifts) do |t|
      t.string(:name)
      t.text(:url)
      t.text(:notes)
      t.bigint(:claimed_by)
      t.timestamps
    end

    create_table(:gift_users) do |t|
      t.references(:gift, null: false, foreign_key: true)
      t.references(:user, null: false, foreign_key: true)
      t.index([:gift_id, :user_id], unique: true)

      t.timestamps
    end

    create_table(:families) do |t|
      t.string(:name, null: false)
      t.integer(:pin, null: false)
    end

    create_table(:family_users) do |t|
      t.references(:family, null: false, foreign_key: true)
      t.references(:user, null: false, foreign_key: true)
      t.timestamps
      t.index([:family_id, :user_id], unique: true)
    end
  end
end
