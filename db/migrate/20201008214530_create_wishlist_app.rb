# frozen_string_literal: true

class CreateWishlistApp < ActiveRecord::Migration[5.2]
  def change
    create_table(:families) do |t|
      t.string(:name)
    end

    create_table(:users) do |t|
      t.string(:name)
      t.string(:password_digest)
      t.belongs_to(:family, index: true)
      t.timestamps
    end

    create_table(:gifts) do |t|
      t.string(:name)
      t.text(:url)
      t.text(:notes)
      t.bigint(:claimed_by)
      t.belongs_to(:user, index: true)
      t.timestamps
    end
  end
end
