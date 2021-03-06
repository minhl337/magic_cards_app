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

ActiveRecord::Schema.define(version: 2019_05_09_163355) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "postal_code"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "set_name"
    t.string "collector_number"
    t.string "small_pic_url"
    t.string "normal_pic_url"
    t.string "price"
    t.integer "quantity", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards_shopping_carts", force: :cascade do |t|
    t.integer "shopping_cart_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "customer_id"
    t.string "full_name"
    t.string "card_number"
    t.string "expiration_date"
    t.string "security_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "store_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "card_id"
    t.integer "customer_id"
    t.integer "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
