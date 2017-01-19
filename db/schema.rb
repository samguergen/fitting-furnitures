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

ActiveRecord::Schema.define(version: 20170117193931) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "furniture_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "furnitures", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.string   "condition"
    t.string   "dimensions"
    t.string   "image"
    t.integer  "furnipoints"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                          null: false
    t.integer  "age",                           null: false
    t.string   "location",                      null: false
    t.string   "email",                         null: false
    t.string   "password_digest"
    t.string   "gender",                        null: false
    t.string   "description"
    t.string   "image"
    t.integer  "furnipoints",     default: 500, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "furniture_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "wishlists", ["furniture_id"], name: "index_wishlists_on_furniture_id"
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end
