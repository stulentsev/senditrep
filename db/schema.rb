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

ActiveRecord::Schema.define(version: 20131111164056) do

  create_table "cdek_locations", force: true do |t|
    t.integer  "num"
    t.string   "city_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "city_name"
    t.string   "city_region"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "center"
  end

  create_table "deliveries", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extra1"
    t.string   "extra2"
    t.string   "extra3"
    t.string   "image_url"
  end

  create_table "emslocations", force: true do |t|
    t.string   "locationtype"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indices", force: true do |t|
    t.integer  "city_index"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkname"
  end

  create_table "spsr_locations", force: true do |t|
    t.integer  "city_id"
    t.integer  "city_number"
    t.integer  "city_owner_number"
    t.string   "city_name"
    t.string   "region_name"
    t.integer  "region_number"
    t.integer  "region_owner_number"
    t.integer  "country_number"
    t.integer  "country_owner_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
