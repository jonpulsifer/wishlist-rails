# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_08_214530) do

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "purchased_by"
    t.integer "spoken_for_by"
    t.integer "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wishlist_id"], name: "index_gifts_on_wishlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "shirt_size"
    t.string "pant_size"
    t.string "shoe_size"
    t.string "fav_color"
    t.boolean "plus_one"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

end
