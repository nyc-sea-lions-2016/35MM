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

ActiveRecord::Schema.define(version: 20160418181641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",          null: false
    t.integer  "user_id",          null: false
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "films", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.string   "title",       null: false
    t.string   "summary"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "films", ["category_id"], name: "index_films_on_category_id", using: :btree
  add_index "films", ["title"], name: "index_films_on_title", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.integer  "ratable_id",   null: false
    t.string   "ratable_type", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "ratings", ["ratable_type", "ratable_id"], name: "index_ratings_on_ratable_type_and_ratable_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "film_id",                    null: false
    t.integer  "user_id",                    null: false
    t.boolean  "flag",       default: false
    t.text     "content",                    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "reviews", ["film_id"], name: "index_reviews_on_film_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "trusted",         default: false
    t.string   "username",                        null: false
    t.string   "email",                           null: false
    t.string   "pic_url"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
