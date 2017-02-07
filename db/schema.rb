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

ActiveRecord::Schema.define(version: 20170207172136) do

  create_table "measurements", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "insolation",                  precision: 22, scale: 17
    t.decimal  "unit_a",                      precision: 22, scale: 17
    t.decimal  "unit_b",                      precision: 22, scale: 17
    t.decimal  "unit_c",                      precision: 22, scale: 17
    t.decimal  "unit_d",                      precision: 22, scale: 17
    t.integer  "power_sub_unit_id", limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "measurements", ["power_sub_unit_id"], name: "index_measurements_on_power_sub_unit_id", using: :btree
  add_index "measurements", ["start_date"], name: "index_measurements_on_start_date", using: :btree

  create_table "power_sub_units", force: :cascade do |t|
    t.string   "unit",          limit: 255
    t.integer  "power_unit_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "power_sub_units", ["power_unit_id"], name: "index_power_sub_units_on_power_unit_id", using: :btree

  create_table "power_units", force: :cascade do |t|
    t.string   "unit",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
