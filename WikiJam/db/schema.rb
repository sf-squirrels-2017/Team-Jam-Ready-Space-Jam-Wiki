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

ActiveRecord::Schema.define(version: 20170216000144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.boolean  "published"
    t.boolean  "citation_required"
    t.integer  "creator_id"
    t.integer  "category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["creator_id"], name: "index_articles_on_creator_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citations", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_citations_on_article_id", using: :btree
    t.index ["user_id"], name: "index_citations_on_user_id", using: :btree
  end

  create_table "edits", force: :cascade do |t|
    t.string   "article_body"
    t.string   "article_title"
    t.integer  "editor_id"
    t.integer  "article_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["article_id"], name: "index_edits_on_article_id", using: :btree
    t.index ["editor_id"], name: "index_edits_on_editor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
