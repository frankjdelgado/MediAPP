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

ActiveRecord::Schema.define(version: 20150120020912) do

  create_table "frequencies", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frequencies", ["value"], name: "index_frequencies_on_value", unique: true

  create_table "medication_types", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medication_types", ["value"], name: "index_medication_types_on_value", unique: true

  create_table "medications", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medications", ["name"], name: "index_medications_on_name", unique: true

  create_table "password_reminders", force: true do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "password_reminders", ["user_id"], name: "index_password_reminders_on_user_id"

  create_table "treatments", force: true do |t|
    t.date     "start"
    t.date     "finish"
    t.time     "hour"
    t.integer  "frecuency"
    t.integer  "frecuency_id"
    t.integer  "user_id"
    t.integer  "medication_id"
    t.integer  "unit_id"
    t.integer  "medication_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatments", ["frecuency_id"], name: "index_treatments_on_frecuency_id"
  add_index "treatments", ["medication_id"], name: "index_treatments_on_medication_id"
  add_index "treatments", ["medication_type_id"], name: "index_treatments_on_medication_type_id"
  add_index "treatments", ["unit_id"], name: "index_treatments_on_unit_id"
  add_index "treatments", ["user_id"], name: "index_treatments_on_user_id"

  create_table "units", force: true do |t|
    t.string   "value",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["value"], name: "index_units_on_value", unique: true

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
