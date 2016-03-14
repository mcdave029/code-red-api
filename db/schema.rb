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

ActiveRecord::Schema.define(version: 20160314105125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "classification"
    t.string   "name"
    t.string   "contact"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "medical_records", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "blood_type"
    t.text     "medical_conditions"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "medical_records", ["user_id"], name: "index_medical_records_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "user_type"
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "medical_records", "users"
end
