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

ActiveRecord::Schema.define(version: 20140822162838) do

  create_table "availabilities", force: true do |t|
    t.text     "date"
    t.text     "start"
    t.text     "end"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["user_id"], name: "index_availabilities_on_user_id"

  create_table "bookings", force: true do |t|
    t.text     "date"
    t.text     "start"
    t.text     "end"
    t.integer  "uid"
    t.boolean  "confirmed",  default: false
    t.boolean  "paid",       default: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
  end

  add_index "bookings", ["product_id"], name: "index_bookings_on_product_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "bstart"
    t.text     "b_end"
    t.text     "bdate"
    t.integer  "uid"
    t.text     "info"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booking_id"
    t.text     "name"
    t.text     "ctime"
  end

  add_index "messages", ["product_id"], name: "index_messages_on_product_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "length"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "recipient_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
