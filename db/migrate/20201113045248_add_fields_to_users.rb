# frozen_string_literal: true
class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table(:users) do |t|
      t.text(:address)
      t.string(:shirt_size)
      t.string(:pant_size)
      t.string(:shoe_size)
      t.string(:dress_size)
    end
  end
end
