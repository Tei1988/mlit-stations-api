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

ActiveRecord::Schema.define(version: 20160403170000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"
  enable_extension "postgis_topology"

  create_table "companies", force: :cascade do |t|
    t.integer  "service_provider_type_id", null: false
    t.text     "name",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "railway_lines", force: :cascade do |t|
    t.integer  "company_id",      null: false
    t.integer  "railway_type_id", null: false
    t.text     "name",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stations", force: :cascade do |t|
    t.integer   "railway_line_id",                                                             null: false
    t.text      "name",                                                                        null: false
    t.geography "location",           limit: {:srid=>6668, :type=>"point", :geographic=>true}
    t.text      "original_signature",                                                          null: false
    t.datetime  "created_at",                                                                  null: false
    t.datetime  "updated_at",                                                                  null: false
  end

  add_index "stations", ["location"], name: "index_stations_on_location", using: :gist

end
