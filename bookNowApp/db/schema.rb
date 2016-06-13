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

ActiveRecord::Schema.define(version: 20160613221152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end
