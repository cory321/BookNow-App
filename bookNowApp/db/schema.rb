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

ActiveRecord::Schema.define(version: 20160625061453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
  end

  create_table "couples", force: :cascade do |t|
    t.date     "wedding_date"
    t.string   "groom_first_name"
    t.string   "groom_last_name"
    t.string   "groom_email"
    t.string   "groom_phone"
    t.string   "groom_location_gr"
    t.string   "bride_first_name"
    t.string   "bride_last_name"
    t.string   "bride_email"
    t.string   "bride_phone"
    t.string   "bride_location_gr"
    t.string   "planner_first_name"
    t.string   "planner_last_name"
    t.string   "planner_email"
    t.string   "planner_phone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "ceremony_address"
    t.string   "reception_address"
    t.string   "marital_address"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  add_index "couples", ["event_id"], name: "index_couples_on_event_id", using: :btree
  add_index "couples", ["user_id"], name: "index_couples_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "all_day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "couples", "events"
  add_foreign_key "couples", "users"
  add_foreign_key "events", "users"
end
