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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "start_date"
    t.string "end_date"
    t.string "start_time"
    t.string "end_time"
    t.string "deadline"
    t.string "postcode"
    t.string "address"
    t.string "eligibility_criteria"
    t.integer "capacity"
    t.string "link"
    t.string "email"
    t.string "status"
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_activities_on_tag_id"
  end

  create_table "activities_ages", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "age_id", null: false
    t.index ["activity_id", "age_id"], name: "index_activities_ages_on_activity_id_and_age_id"
  end

  create_table "activities_deliveries", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "delivery_id", null: false
    t.index ["activity_id", "delivery_id"], name: "index_activities_deliveries_on_activity_id_and_delivery_id"
  end

  create_table "activities_subjects", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "subject_id", null: false
    t.index ["activity_id", "subject_id"], name: "index_activities_subjects_on_activity_id_and_subject_id"
  end

  create_table "activities_themes", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "theme_id", null: false
    t.index ["activity_id", "theme_id"], name: "index_activities_themes_on_activity_id_and_theme_id"
  end

  create_table "ages", force: :cascade do |t|
    t.string "age"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "delivery_method"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
  end

  create_table "tags", force: :cascade do |t|
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme_name"
  end

  add_foreign_key "activities", "tags"
end
