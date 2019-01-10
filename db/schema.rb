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

ActiveRecord::Schema.define(version: 2019_01_10_153735) do

  create_table "listings", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "neighborhood"
    t.integer "price"
    t.integer "num_beds"
    t.integer "num_bath"
    t.boolean "no_fee"
    t.boolean "dishwasher"
    t.boolean "guarantors_accepted"
    t.boolean "outdoor_space"
    t.boolean "laundry_in_unit"
    t.boolean "laundry_in_building"
    t.boolean "doorman"
    t.boolean "package_handling"
    t.boolean "elevator"
    t.boolean "gym"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
  end

end
