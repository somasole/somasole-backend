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

ActiveRecord::Schema.define(version: 20170831012728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "author"
    t.string "headline"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "text_image_data"
    t.text "plain_image_data"
  end

  create_table "circuits", force: :cascade do |t|
    t.bigint "workout_id"
    t.bigint "setup_id"
    t.integer "sets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setup_id"], name: "index_circuits_on_setup_id"
    t.index ["workout_id"], name: "index_circuits_on_workout_id"
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "circuit_id"
    t.integer "time"
    t.text "description"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circuit_id"], name: "index_movements_on_circuit_id"
  end

  create_table "setups", force: :cascade do |t|
    t.integer "length"
    t.integer "legacy_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_workouts", id: false, force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "tag_id", null: false
    t.index ["tag_id", "workout_id"], name: "index_tags_workouts_on_tag_id_and_workout_id"
    t.index ["workout_id", "tag_id"], name: "index_tags_workouts_on_workout_id_and_tag_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_id"
    t.text "description"
    t.integer "duration"
    t.string "title"
    t.boolean "featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.integer "intensity"
    t.text "description"
    t.boolean "featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_data"
  end

  add_foreign_key "circuits", "setups"
  add_foreign_key "circuits", "workouts"
  add_foreign_key "movements", "circuits"
end
