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

ActiveRecord::Schema.define(version: 20161229044758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.text     "body"
    t.integer  "teacher_request_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["teacher_request_id"], name: "index_comments_on_teacher_request_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "followships", force: :cascade do |t|
    t.integer "teacher_id",   null: false
    t.integer "supporter_id", null: false
    t.index ["supporter_id"], name: "index_followships_on_supporter_id", using: :btree
    t.index ["teacher_id", "supporter_id"], name: "index_followships_on_teacher_id_and_supporter_id", unique: true, using: :btree
    t.index ["teacher_id"], name: "index_followships_on_teacher_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "state"
    t.jsonb    "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teacher_requests", force: :cascade do |t|
    t.integer  "teaching_position_id", null: false
    t.string   "title",                null: false
    t.text     "description",          null: false
    t.datetime "closed_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["teaching_position_id"], name: "index_teacher_requests_on_teaching_position_id", using: :btree
  end

  create_table "teaching_positions", force: :cascade do |t|
    t.integer  "teacher_id", null: false
    t.integer  "school_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teaching_positions_on_school_id", using: :btree
    t.index ["teacher_id", "school_id"], name: "index_teaching_positions_on_teacher_id_and_school_id", unique: true, using: :btree
    t.index ["teacher_id"], name: "index_teaching_positions_on_teacher_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "title"
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "category"
    t.jsonb    "auth_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "teacher_requests"
  add_foreign_key "comments", "users"
  add_foreign_key "followships", "users", column: "supporter_id"
  add_foreign_key "followships", "users", column: "teacher_id"
  add_foreign_key "teacher_requests", "teaching_positions"
  add_foreign_key "teaching_positions", "schools"
  add_foreign_key "teaching_positions", "users", column: "teacher_id"
end
