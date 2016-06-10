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

ActiveRecord::Schema.define(version: 20160610090044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couples", force: :cascade do |t|
    t.date     "wedding_date"
    t.text     "groom_first_name"
    t.text     "groom_last_name"
    t.text     "groom_email"
    t.text     "groom_phone"
    t.text     "groom_location_gr"
    t.text     "bride_first_name"
    t.text     "bride_last_name"
    t.text     "bride_email"
    t.text     "bride_phone"
    t.text     "bride_location_gr"
    t.text     "planner_first_name"
    t.text     "planner_last_name"
    t.text     "planner_email"
    t.text     "planner_phone"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
