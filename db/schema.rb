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

ActiveRecord::Schema.define(version: 20130916090829) do

  create_table "favorites", id: false, force: true do |t|
    t.integer "user_id",  null: false
    t.integer "tweet_id", null: false
  end

  create_table "oauth_requests", force: true do |t|
    t.integer  "user_id"
    t.string   "request_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.string   "tweet"
    t.string   "source"
    t.string   "tweet_type"
    t.integer  "recipient_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "in_reply_to_status_id"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",            limit: 40
    t.string   "name",                limit: 100, default: ""
    t.string   "email",               limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bio"
    t.string   "location"
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
    t.string   "encrypted_password",              default: "", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
