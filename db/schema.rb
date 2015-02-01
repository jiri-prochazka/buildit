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

ActiveRecord::Schema.define(version: 20150131191855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "confirmed_at"
    t.integer  "progress"
    t.integer  "estimated_time"
    t.decimal  "estimated_price"
    t.decimal  "real_price"
    t.datetime "completed_at"
    t.integer  "project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "estimated_finish"
    t.datetime "completed_at"
    t.boolean  "archived"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "concept_id"
  end

  add_index "projects", ["concept_id"], name: "index_projects_on_concept_id", using: :btree

  add_foreign_key "jobs", "projects"
  add_foreign_key "projects", "concepts"
end
