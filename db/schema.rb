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

ActiveRecord::Schema[7.0].define(version: 2024_02_01_094911) do
  create_table "mains", force: :cascade do |t|
    t.integer "subject_id"
    t.text "question"
    t.integer "selection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "out_sites", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selections", force: :cascade do |t|
    t.string "text"
    t.integer "main_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
  end

  create_table "solution_selections", force: :cascade do |t|
    t.integer "solution_id"
    t.integer "selection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.string "kana"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sort_sentences", force: :cascade do |t|
    t.string "word1"
    t.string "word2"
    t.string "word3"
    t.string "word4"
    t.string "word5"
    t.string "word6"
    t.string "word7"
    t.string "word8"
    t.string "word9"
    t.string "word10"
    t.string "word11"
    t.string "word12"
    t.string "word13"
    t.string "word14"
    t.string "word15"
    t.string "word16"
    t.string "word17"
    t.string "word18"
    t.string "word19"
    t.string "word20"
    t.string "sentence"
    t.integer "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sort_units", force: :cascade do |t|
    t.string "title"
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "kana"
    t.string "affiliation"
    t.integer "birthday"
    t.integer "current_time", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "teacher", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.string "name"
    t.string "affiliation"
    t.integer "introducer", null: false
    t.datetime "auth_email_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.string "mean"
    t.integer "student_id"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mistake_num"
  end

end
