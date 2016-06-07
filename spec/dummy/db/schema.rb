# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160607124927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "shareconomy_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shareconomy_listings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shareconomy_listings", ["category_id"], name: "index_shareconomy_listings_on_category_id", using: :btree
  add_index "shareconomy_listings", ["user_id"], name: "index_shareconomy_listings_on_user_id", using: :btree

  create_table "shareconomy_locations", force: :cascade do |t|
    t.string   "state"
    t.string   "city"
    t.string   "district"
    t.string   "street"
    t.string   "zip_code"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shareconomy_locations", ["listing_id"], name: "index_shareconomy_locations_on_listing_id", using: :btree

  create_table "shareconomy_messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.text     "body"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "shareconomy_messages", ["recipient_id"], name: "index_shareconomy_messages_on_recipient_id", using: :btree
  add_index "shareconomy_messages", ["sender_id"], name: "index_shareconomy_messages_on_sender_id", using: :btree

  create_table "shareconomy_orders", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "listing_id"
    t.string   "aasm_state"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "shareconomy_orders", ["buyer_id"], name: "index_shareconomy_orders_on_buyer_id", using: :btree
  add_index "shareconomy_orders", ["listing_id"], name: "index_shareconomy_orders_on_listing_id", using: :btree
  add_index "shareconomy_orders", ["seller_id"], name: "index_shareconomy_orders_on_seller_id", using: :btree

  create_table "shareconomy_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.date     "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shareconomy_ratings", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "value"
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shareconomy_ratings", ["listing_id"], name: "index_shareconomy_ratings_on_listing_id", using: :btree
  add_index "shareconomy_ratings", ["user_id"], name: "index_shareconomy_ratings_on_user_id", using: :btree

  create_table "shareconomy_users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shareconomy_users", ["email"], name: "index_shareconomy_users_on_email", using: :btree
  add_index "shareconomy_users", ["reset_password_token"], name: "index_shareconomy_users_on_reset_password_token", unique: true, using: :btree
  add_index "shareconomy_users", ["uid", "provider"], name: "index_shareconomy_users_on_uid_and_provider", unique: true, using: :btree

end
