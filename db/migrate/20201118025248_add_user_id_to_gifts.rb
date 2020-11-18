# frozen_string_literal: true
class AddUserIdToGifts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        add_reference(:gifts, :user)
        GiftUser.find_each do |gift_user|
          gift = gift_user.gift
          gift.user_id = gift_user.user_id
          gift.save!
        end
        drop_join_table(:gift, :users)
      end

      dir.down do
        create_table(:gift_users) do |t|
          t.references(:gift, null: false, foreign_key: true)
          t.references(:user, null: false, foreign_key: true)
          t.index([:gift_id, :user_id], unique: true)

          t.timestamps
        end
        remove_reference(:gifts, :user)
      end
    end
  end
end
