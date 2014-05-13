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

ActiveRecord::Schema.define(version: 20140509031612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "providers", force: true do |t|
    t.string   "npi",                     limit: 10, null: false
    t.string   "entity",                  limit: 25, null: false
    t.string   "ein"
    t.string   "legal_name",                         null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "credential"
    t.date     "enumerated_at"
    t.date     "last_updated_at"
    t.string   "deactivated_reason_code"
    t.date     "deactivated_at"
    t.date     "reactivated_at"
    t.string   "gender_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["entity", "legal_name"], name: "index_providers_on_entity_and_legal_name", using: :btree
  add_index "providers", ["npi"], name: "index_providers_on_npi", unique: true, using: :btree

end
