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

ActiveRecord::Schema.define(version: 20160403212954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "loyalties", force: :cascade do |t|
    t.text     "content"
    t.integer  "stakeholder_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stakeholders", force: :cascade do |t|
    t.text     "name"
    t.integer  "worksheet_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "values", force: :cascade do |t|
    t.integer  "worksheet_id"
    t.text     "content"
    t.string   "temporary_worksheet_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "worksheets", force: :cascade do |t|
    t.text     "change_needed"
    t.string   "temporary_worksheet_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "elephant1"
    t.integer  "elephant2"
    t.string   "responsible1"
    t.string   "responsible2"
    t.string   "independent1"
    t.string   "independent2"
    t.string   "develop1"
    t.string   "develop2"
    t.string   "reflection1"
    t.string   "reflection2"
    t.integer  "antifragile"
    t.string   "permission_to_contact"
    t.text     "email"
  end

end
