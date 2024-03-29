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

ActiveRecord::Schema.define(version: 20140501015128) do

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "product"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
  end

  add_index "businesses", ["category_id"], name: "index_businesses_on_category_id"
  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id"

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.string   "description"
    t.string   "business_id"
    t.string   "integer"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "member_since"
    t.datetime "expires"
    t.string   "street"
    t.string   "city"
    t.string   "state",           limit: 2
    t.string   "zip",             limit: 5
    t.string   "cell_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"

end
