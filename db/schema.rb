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

ActiveRecord::Schema[7.0].define(version: 2022_12_14_013933) do
  create_table "currencies", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "code", limit: 7, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "rates", force: :cascade do |t|
    t.integer "base_id", null: false
    t.integer "target_id", null: false
    t.decimal "amount", precision: 15, scale: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_id"], name: "index_rates_on_base_id"
    t.index ["target_id"], name: "index_rates_on_target_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "api_key", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_users_on_api_key", unique: true
  end

  add_foreign_key "rates", "currencies", column: "base_id", on_delete: :cascade
  add_foreign_key "rates", "currencies", column: "target_id", on_delete: :cascade
end
