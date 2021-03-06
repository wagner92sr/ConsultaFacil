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

ActiveRecord::Schema.define(version: 20170712071941) do

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
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.text "observations"
    t.integer "status"
    t.bigint "hospital_id"
    t.bigint "doctor_id"
    t.bigint "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["hospital_id"], name: "index_appointments_on_hospital_id"
    t.index ["paciente_id"], name: "index_appointments_on_paciente_id"
  end

  create_table "cids", force: :cascade do |t|
    t.string "cid"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "crm"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.integer "skill"
    t.bigint "hospital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "address", limit: 30, null: false
    t.string "city", limit: 30, null: false
    t.string "phone", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.text "description"
  end

  create_table "medical_records", force: :cascade do |t|
    t.text "observations"
    t.string "references"
    t.string "doctor"
    t.string "paciente"
    t.string "hospital"
    t.string "appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_member_id"
    t.index ["profile_member_id"], name: "index_medical_records_on_profile_member_id"
  end

  create_table "pacientes", force: :cascade do |t|
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
    t.index ["email"], name: "index_pacientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_pacientes_on_reset_password_token", unique: true
  end

  create_table "patients", force: :cascade do |t|
    t.integer "cpf"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "profile_members", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.date "birthdate"
    t.string "mother_name"
    t.bigint "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_profile_members_on_paciente_id"
  end

  add_foreign_key "doctors", "hospitals"
  add_foreign_key "medical_records", "profile_members"
  add_foreign_key "profile_members", "pacientes"
end
