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


ActiveRecord::Schema.define(version: 20171123123857) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "courts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criminal_records", force: :cascade do |t|
    t.string "procedural_stage"
    t.string "inquire_number"
    t.date "intervention_date"
    t.string "type_of_crime"
    t.string "commission_place"
    t.date "commission_date"
    t.string "prosecutor_unit"
    t.text "precautionary_measures"
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

  create_table "equipment_details", force: :cascade do |t|
    t.bigint "legal_case_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_equipment_details_on_legal_case_id"
    t.index ["user_id"], name: "index_equipment_details_on_user_id"
  end

  create_table "hearings", force: :cascade do |t|
    t.date "hearing_date"
    t.bigint "user_id"
    t.bigint "legal_case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_hearings_on_legal_case_id"
    t.index ["user_id"], name: "index_hearings_on_user_id"
  end

  create_table "judges", force: :cascade do |t|
    t.bigint "court_id"
    t.bigint "entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_judges_on_court_id"
    t.index ["entity_id"], name: "index_judges_on_entity_id"
  end

  create_table "lawyer_actions", force: :cascade do |t|
    t.date "action_date"
    t.bigint "legal_case_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_lawyer_actions_on_legal_case_id"
  end

  create_table "legal_cases", force: :cascade do |t|
    t.text "entry_form"
    t.string "name"
    t.bigint "user_id"
    t.bigint "court_id"
    t.bigint "judge_id"
    t.bigint "suspect_id"
    t.bigint "criminal_record_id"
    t.text "comment"
    t.string "final_sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["court_id"], name: "index_legal_cases_on_court_id"
    t.index ["criminal_record_id"], name: "index_legal_cases_on_criminal_record_id"
    t.index ["judge_id"], name: "index_legal_cases_on_judge_id"
    t.index ["suspect_id"], name: "index_legal_cases_on_suspect_id"
    t.index ["user_id"], name: "index_legal_cases_on_user_id"
  end

  create_table "reclusions", force: :cascade do |t|
    t.bigint "suspect_id"
    t.string "place"
    t.date "date_entry"
    t.date "date_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suspect_id"], name: "index_reclusions_on_suspect_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.date "shift_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shifts_on_user_id"
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

  create_table "transfer_cases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "legal_case_id"
    t.text "comentary"
    t.date "date_ttransfer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_transfer_cases_on_legal_case_id"
    t.index ["user_id"], name: "index_transfer_cases_on_user_id"
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
    t.string "type_user"
    t.bigint "entity_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["entity_id"], name: "index_users_on_entity_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "suspect_id"
    t.string "name_visit"
    t.date "date_visit"
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suspect_id"], name: "index_visits_on_suspect_id"
  end

  add_foreign_key "equipment_details", "legal_cases"
  add_foreign_key "equipment_details", "users"
  add_foreign_key "hearings", "legal_cases"
  add_foreign_key "hearings", "users"
  add_foreign_key "judges", "courts"
  add_foreign_key "judges", "entities"
  add_foreign_key "lawyer_actions", "legal_cases"
  add_foreign_key "legal_cases", "courts"
  add_foreign_key "legal_cases", "criminal_records"
  add_foreign_key "legal_cases", "judges"
  add_foreign_key "legal_cases", "suspects"
  add_foreign_key "legal_cases", "users"
  add_foreign_key "reclusions", "suspects"
  add_foreign_key "shifts", "users"
  add_foreign_key "suspects", "entities"
  add_foreign_key "transfer_cases", "legal_cases"
  add_foreign_key "transfer_cases", "users"
  add_foreign_key "users", "entities"
  add_foreign_key "visits", "suspects"
end
