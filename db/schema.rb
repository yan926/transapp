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

ActiveRecord::Schema.define(version: 20161025134959) do

  create_table "aboutpages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ccspublications", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cat"
    t.string   "title"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "eventpages", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicationpages", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "cat"
  end

  create_table "scopepages", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialissues", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
