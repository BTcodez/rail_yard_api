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

ActiveRecord::Schema[7.1].define(version: 2024_05_21_005009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string "car_id", null: false
    t.datetime "requested_date"
    t.datetime "received_date"
    t.datetime "extraction_start"
    t.datetime "extraction_end"
    t.datetime "release_date"
    t.bigint "raw_material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight"
    t.bigint "user_id"
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["raw_material_id"], name: "index_orders_on_raw_material_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "material_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "raw_materials"
  add_foreign_key "orders", "users"
end
