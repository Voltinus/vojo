# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_03_111615) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "language"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "forum_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "forum_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content"
    t.integer "forum_topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["forum_topic_id"], name: "index_forum_posts_on_forum_topic_id"
    t.index ["user_id"], name: "index_forum_posts_on_user_id"
  end

  create_table "forum_subcategories", force: :cascade do |t|
    t.string "name"
    t.integer "forum_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["forum_category_id"], name: "index_forum_subcategories_on_forum_category_id"
  end

  create_table "forum_topics", force: :cascade do |t|
    t.string "name"
    t.integer "forum_subcategory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "language"
    t.index ["forum_subcategory_id"], name: "index_forum_topics_on_forum_subcategory_id"
    t.index ["user_id"], name: "index_forum_topics_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "from_id", null: false
    t.integer "to_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "forum_posts", "forum_topics"
  add_foreign_key "forum_posts", "users"
  add_foreign_key "forum_subcategories", "forum_categories"
  add_foreign_key "forum_topics", "forum_subcategories"
  add_foreign_key "forum_topics", "users"
end
