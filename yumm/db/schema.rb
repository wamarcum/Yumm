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

ActiveRecord::Schema.define(version: 20141119034734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string "name"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "employees", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pin"
    t.boolean  "manager",    default: false
  end

  add_index "employees", ["pin"], name: "index_employees_on_pin", unique: true, using: :btree

  create_table "items", force: true do |t|
    t.text     "name"
    t.integer  "quantity"
    t.float    "cost"
    t.text     "comment"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "items", ["ticket_id"], name: "index_items_on_ticket_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tables", force: true do |t|
    t.string   "number"
    t.string   "guests"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tables", ["number"], name: "index_tables_on_number", unique: true, using: :btree

  create_table "tickets", force: true do |t|
    t.integer  "table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "togo",       default: false
  end

  add_index "tickets", ["table_id"], name: "index_tickets_on_table_id", using: :btree

end
