# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_14_094754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkout", force: :cascade do |t|
    t.bigint "buyer_id"
    t.bigint "listing_id"
    t.bigint "payment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_checkout_on_buyer_id"
    t.index ["listing_id"], name: "index_checkout_on_listing_id"
    t.index ["payment_id"], name: "index_checkout_on_payment_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "brand"
    t.string "sneaker_model_name"
    t.string "size"
    t.float "price"
    t.string "condition"
    t.boolean "availability"
    t.bigint "seller_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seller_id"], name: "index_listings_on_seller_id"
  end

  create_table "payments", force: :cascade do |t|
    t.boolean "success"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checkout", "listings"
  add_foreign_key "checkout", "payments"
  add_foreign_key "checkout", "users", column: "buyer_id"
  add_foreign_key "listings", "users", column: "seller_id"
end
