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

ActiveRecord::Schema[7.0].define(version: 2022_04_12_124447) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "code"
    t.text "description"
    t.integer "difficulty"
    t.string "address"
    t.string "author"
    t.string "author_github"
    t.string "author_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "contract_abi"
    t.string "setup_address"
    t.string "value"
    t.string "verified_url"
    t.text "setup_code"
    t.integer "tags", default: [], array: true
  end

  create_table "instances", force: :cascade do |t|
    t.bigint "challenge_id", null: false
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_instances_on_challenge_id"
    t.index ["user_id"], name: "index_instances_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "emoji"
    t.string "emojiColor"
    t.text "description"
    t.string "stack", default: [], array: true
    t.string "tagsTitles", default: [], array: true
    t.string "tagsUrls", default: [], array: true
    t.string "tagsColor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description_title"
    t.integer "rank_of_appearance"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "address"
    t.string "levels_started", default: [], array: true
    t.string "levels_finished", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "instances", "challenges"
  add_foreign_key "instances", "users"
end
