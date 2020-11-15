# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_08_214530) do

  create_table "families", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "pin", null: false
  end

  create_table "family_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "family_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id", "user_id"], name: "index_family_users_on_family_id_and_user_id", unique: true
    t.index ["family_id"], name: "index_family_users_on_family_id"
    t.index ["user_id"], name: "index_family_users_on_user_id"
  end

  create_table "gift_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "gift_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id", "user_id"], name: "index_gift_users_on_gift_id_and_user_id", unique: true
    t.index ["gift_id"], name: "index_gift_users_on_gift_id"
    t.index ["user_id"], name: "index_gift_users_on_user_id"
  end

  create_table "gifts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "url"
    t.text "notes"
    t.bigint "claimed_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.text "address"
    t.string "shirt_size"
    t.string "pant_size"
    t.string "shoe_size"
    t.string "dress_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "family_users", "families"
  add_foreign_key "family_users", "users"
  add_foreign_key "gift_users", "gifts"
  add_foreign_key "gift_users", "users"
end
