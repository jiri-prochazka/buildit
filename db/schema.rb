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

ActiveRecord::Schema.define(version: 20150201195300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.integer  "zip"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "name"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "attachments", ["employee_id"], name: "index_attachments_on_employee_id", using: :btree
  add_index "attachments", ["job_id"], name: "index_attachments_on_job_id", using: :btree

  create_table "concepts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "concepts", ["user_id"], name: "index_concepts_on_user_id", using: :btree

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
    t.integer  "employee_id"
  end

  add_index "jobs", ["employee_id"], name: "index_jobs_on_employee_id", using: :btree
  add_index "jobs", ["project_id"], name: "index_jobs_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "estimated_finish"
    t.datetime "completed_at"
    t.boolean  "archived"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "concept_id"
    t.integer  "customer_id"
    t.integer  "employee_id"
  end

  add_index "projects", ["concept_id"], name: "index_projects_on_concept_id", using: :btree
  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id", using: :btree
  add_index "projects", ["employee_id"], name: "index_projects_on_employee_id", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.text     "content"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "requirements", ["customer_id"], name: "index_requirements_on_customer_id", using: :btree
  add_index "requirements", ["project_id"], name: "index_requirements_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "failed_attempts",    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "type"
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.datetime "employed_since"
    t.boolean  "admin"
    t.string   "position"
    t.string   "salutation"
    t.string   "nationality"
    t.boolean  "newsletter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "attachments", "jobs"
  add_foreign_key "attachments", "users", column: "employee_id"
  add_foreign_key "concepts", "users"
  add_foreign_key "jobs", "projects"
  add_foreign_key "jobs", "users", column: "employee_id"
  add_foreign_key "projects", "concepts"
  add_foreign_key "projects", "users", column: "customer_id"
  add_foreign_key "projects", "users", column: "employee_id"
  add_foreign_key "requirements", "projects"
  add_foreign_key "requirements", "users", column: "customer_id"
end
