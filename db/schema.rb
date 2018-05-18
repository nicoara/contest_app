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

ActiveRecord::Schema.define(version: 20180518133428) do

  create_table "age_sections", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.string "country", null: false
    t.integer "price", null: false
    t.string "currency", null: false
    t.integer "max_couples_on_floor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "couples", force: :cascade do |t|
    t.integer "boy_id", null: false
    t.integer "girl_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boy_id", "girl_id"], name: "index_couples_on_boy_id_and_girl_id", unique: true
  end

  create_table "dancers", force: :cascade do |t|
    t.string "name", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_boy"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "couple_id", null: false
    t.integer "competition_id", null: false
    t.integer "division_id", null: false
    t.integer "age_section_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
