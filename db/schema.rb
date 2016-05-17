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

ActiveRecord::Schema.define(version: 20160517173150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total_price"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string "email"
    t.string "password"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "seller",            default: false
    t.string   "name"
    t.string   "ssn"
    t.string   "address"
    t.string   "date_of_birth"
  end

end
