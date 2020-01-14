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

ActiveRecord::Schema.define(version: 2020_01_13_222152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string "model"
    t.integer "economy_seats"
    t.integer "business_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "name"
    t.string "iata"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.string "pnr"
    t.float "total_price"
    t.string "flight_id"
    t.string "booking_class"
    t.integer "passengers"
    t.string "mail"
    t.integer "user_id"
    t.string "first_name_1"
    t.string "last_name_1"
    t.string "document_1"
    t.string "seat_1"
    t.decimal "price_1"
    t.string "first_name_2"
    t.string "last_name_2"
    t.string "document_2"
    t.string "seat_2"
    t.decimal "price_2"
    t.string "first_name_3"
    t.string "last_name_3"
    t.string "document_3"
    t.string "seat_3"
    t.decimal "price_3"
    t.string "first_name_4"
    t.string "last_name_4"
    t.string "document_4"
    t.string "seat_4"
    t.decimal "price_4"
    t.string "status"
    t.string "country_1"
    t.string "country_2"
    t.string "country_3"
    t.string "country_4"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "departure_airport_id"
    t.integer "arrival_airport_id"
    t.date "departure_date"
    t.time "departure_time"
    t.time "arrival_time"
    t.string "flight_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airplane_id"
    t.integer "free_seats"
    t.integer "economy_seats"
    t.integer "business_seats"
    t.integer "economy_free_seats"
    t.integer "business_free_seats"
    t.decimal "economy_price"
    t.decimal "business_price"
  end

  create_table "payment_provider_operations", force: :cascade do |t|
    t.string "operation_number"
    t.string "operation_status"
    t.string "email"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.decimal "operation_amount"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flight_id"
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "document_id"
    t.string "country"
    t.string "seat"
    t.decimal "price"
    t.string "seat_class"
    t.integer "booking_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "amount"
    t.string "kind"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed"
    t.integer "payment_provider_operation_id"
    t.integer "booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "document_id"
    t.string "country"
    t.decimal "balance", default: "0.0"
    t.boolean "superadmin_role", default: false
    t.boolean "airline_manager_role", default: false
    t.boolean "client_role", default: false
    t.boolean "airport_manager_role", default: false
    t.integer "airport_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
