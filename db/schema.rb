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

ActiveRecord::Schema.define(version: 20171010021934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistants", force: :cascade do |t|
    t.bigint "lawyer_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["entity_id"], name: "index_assistants_on_entity_id"
    t.index ["lawyer_id"], name: "index_assistants_on_lawyer_id"
    t.index ["user_id"], name: "index_assistants_on_user_id"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.date "birthdate"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judges", force: :cascade do |t|
    t.bigint "court_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_judges_on_court_id"
    t.index ["entity_id"], name: "index_judges_on_entity_id"
  end

  create_table "lawyers", force: :cascade do |t|
    t.string "type_lawyer"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["entity_id"], name: "index_lawyers_on_entity_id"
    t.index ["user_id"], name: "index_lawyers_on_user_id"
  end

  create_table "suspects", force: :cascade do |t|
    t.string "ci"
    t.text "reason"
    t.text "mothers_name"
    t.text "fathers_name"
    t.text "criminal_record"
    t.string "present_status"
    t.string "nationality"
    t.text "home_adress"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_suspects_on_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assistants", "entities"
  add_foreign_key "assistants", "lawyers"
  add_foreign_key "assistants", "users"
  add_foreign_key "judges", "courts"
  add_foreign_key "judges", "entities"
  add_foreign_key "lawyers", "entities"
  add_foreign_key "lawyers", "users"
  add_foreign_key "suspects", "entities"
end