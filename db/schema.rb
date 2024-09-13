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

ActiveRecord::Schema[7.2].define(version: 2024_09_13_032042) do
  create_table "inspections", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "score"
    t.date "inspection_date"
    t.string "inspection_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_inspections_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "phone_number"
    t.string "owner_name"
    t.string "owner_address"
    t.string "owner_city"
    t.string "owner_state"
    t.string "owner_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "violations", force: :cascade do |t|
    t.integer "inspection_id", null: false
    t.date "violation_date"
    t.string "violation_type"
    t.string "risk_category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspection_id"], name: "index_violations_on_inspection_id"
  end

  add_foreign_key "inspections", "restaurants"
  add_foreign_key "violations", "inspections"
end
