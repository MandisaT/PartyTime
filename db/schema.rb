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

ActiveRecord::Schema.define(version: 20160621204442) do

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "party_type"
    t.string   "name"
    t.string   "adress"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "budget"
    t.integer  "product_id"
    t.date     "date"
    t.integer  "guest_list_id"
  end

  create_table "guest_lists", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "extra_guest"
    t.string   "dietary_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "event_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "event_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
