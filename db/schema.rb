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

ActiveRecord::Schema.define(version: 20170427032312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "ends_at"
    t.datetime "starts_at"
    t.integer  "shift_id"
    t.date     "shift_date"
    t.integer  "status",       default: 0
    t.index ["shift_id"], name: "index_events_on_shift_id", using: :btree
    t.index ["volunteer_id"], name: "index_events_on_volunteer_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer  "day"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts_volunteers", id: false, force: :cascade do |t|
    t.integer "volunteer_id", null: false
    t.integer "shift_id",     null: false
    t.index ["shift_id"], name: "index_shifts_volunteers_on_shift_id", using: :btree
    t.index ["volunteer_id"], name: "index_shifts_volunteers_on_volunteer_id", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "full_name"
    t.text     "additional"
    t.integer  "count",         default: 1
    t.string   "home_number"
    t.string   "mobile_number"
    t.boolean  "recieve_texts"
    t.string   "email"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "key_person",    default: false
    t.text     "notes"
    t.index ["group_id"], name: "index_volunteers_on_group_id", using: :btree
  end

end
