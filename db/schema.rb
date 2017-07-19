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

ActiveRecord::Schema.define(version: 20170719180552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "author"
    t.string "headline"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "workout_circuits", force: :cascade do |t|
    t.bigint "workout_id"
    t.integer "sets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_circuits_on_workout_id"
  end

  create_table "workout_tags", force: :cascade do |t|
    t.bigint "workout_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_workout_tags_on_workout_id"
  end

  create_table "workout_workouts", force: :cascade do |t|
    t.string "name"
    t.integer "time"
    t.integer "intensity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "workout_circuits", "workout_workouts", column: "workout_id"
  add_foreign_key "workout_tags", "workout_workouts", column: "workout_id"
end
