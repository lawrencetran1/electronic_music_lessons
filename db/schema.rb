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

ActiveRecord::Schema.define(version: 20150506020715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "tutorial_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "comments", ["tutorial_id"], name: "index_comments_on_tutorial_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "completed_lessons", force: :cascade do |t|
    t.datetime "completed_date"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "completed_lessons", ["lesson_id"], name: "index_completed_lessons_on_lesson_id", using: :btree
  add_index "completed_lessons", ["user_id"], name: "index_completed_lessons_on_user_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "body"
    t.string   "picture"
    t.integer  "tutorial_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lessons", ["tutorial_id"], name: "index_lessons_on_tutorial_id", using: :btree

  create_table "lessons_users", id: false, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
  end

  add_index "lessons_users", ["lesson_id"], name: "index_lessons_users_on_lesson_id", using: :btree
  add_index "lessons_users", ["user_id"], name: "index_lessons_users_on_user_id", using: :btree

  create_table "progesses", force: :cascade do |t|
    t.boolean  "completed"
    t.integer  "status_id"
    t.string   "status_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "progesses", ["status_type", "status_id"], name: "index_progesses_on_status_type_and_status_id", using: :btree

  create_table "tutorials", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id", using: :btree

  create_table "tutorials_users", id: false, force: :cascade do |t|
    t.integer "tutorial_id"
    t.integer "user_id"
  end

  add_index "tutorials_users", ["tutorial_id"], name: "index_tutorials_users_on_tutorial_id", using: :btree
  add_index "tutorials_users", ["user_id"], name: "index_tutorials_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "tutorials"
  add_foreign_key "comments", "users"
  add_foreign_key "completed_lessons", "lessons"
  add_foreign_key "completed_lessons", "users"
  add_foreign_key "lessons", "tutorials"
  add_foreign_key "tutorials", "users"
end
