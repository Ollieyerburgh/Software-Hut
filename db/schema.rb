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

ActiveRecord::Schema.define(version: 20180419140257) do

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
    t.string "status", default: "pending"
    t.bigint "tag_id"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.bigint "user_id"
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_activities_on_subject_id"
    t.index ["tag_id"], name: "index_activities_on_tag_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activities_ages", id: false, force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "age_id", null: false
    t.index ["activity_id", "age_id"], name: "index_activities_ages_on_activity_id_and_age_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postcode"
    t.string "city"
  end

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

  create_table "advisers", force: :cascade do |t|
    t.string "college"
    t.string "role"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_advisers_on_user_id"
  end

  create_table "ages", force: :cascade do |t|
    t.string "age"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "delivery_method"
<<<<<<< HEAD
=======
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "preference_id"
    t.index ["preference_id"], name: "index_deliveries_on_preference_id"
>>>>>>> 20ef384044300dc013420ab6ad07230d9835751e
  end

  create_table "deliveries_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "delivery_id", null: false
    t.index ["user_id", "delivery_id"], name: "index_deliveries_users_on_user_id_and_delivery_id"
  end

  create_table "guardians", force: :cascade do |t|
    t.string "college"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_guardians_on_user_id"
  end

  create_table "learners", force: :cascade do |t|
    t.string "college"
    t.string "dob"
    t.integer "yos"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_learners_on_user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "organisation"
    t.string "role"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_partners_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "description"
    t.string "status", default: "pending"
    t.string "email"
    t.json "resources"
    t.bigint "user_id"
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_resources_on_subject_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
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
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
=======
    t.bigint "preference_id"
    t.bigint "activity_id"
    t.index ["activity_id"], name: "index_subjects_on_activity_id"
    t.index ["preference_id"], name: "index_subjects_on_preference_id"
>>>>>>> 20ef384044300dc013420ab6ad07230d9835751e
  end

  create_table "subjects_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
    t.index ["user_id", "subject_id"], name: "index_subjects_users_on_user_id_and_subject_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "themes", force: :cascade do |t|
    t.string "theme_name"
<<<<<<< HEAD
=======
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "preference_id"
    t.index ["preference_id"], name: "index_themes_on_preference_id"
>>>>>>> 20ef384044300dc013420ab6ad07230d9835751e
  end

  create_table "themes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "theme_id", null: false
    t.index ["user_id", "theme_id"], name: "index_themes_users_on_user_id_and_theme_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "forename"
    t.string "surname"
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
    t.string "postcode"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "activities", "tags"
  add_foreign_key "activities", "users"
  add_foreign_key "advisers", "users"
  add_foreign_key "deliveries", "preferences"
  add_foreign_key "guardians", "users"
  add_foreign_key "learners", "users"
  add_foreign_key "partners", "users"
  add_foreign_key "resources", "users"
  add_foreign_key "subjects", "activities"
  add_foreign_key "subjects", "preferences"
  add_foreign_key "themes", "preferences"
end
