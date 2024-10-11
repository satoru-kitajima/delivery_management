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

ActiveRecord::Schema.define(version: 2024_10_11_051918) do

  create_table "cargos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "train_id"
    t.index ["train_id"], name: "index_cargos_on_train_id"
  end

  create_table "dropoffs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "available_time_start"
    t.datetime "available_time_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "size"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "item_id"
    t.bigint "request_id"
    t.index ["item_id"], name: "fk_rails_0b8e2d4ba7"
    t.index ["request_id"], name: "fk_rails_6d5efc2c7d"
  end

  create_table "pickups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.datetime "available_time_start"
    t.datetime "available_time_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "delivery_date"
    t.boolean "pickup_required"
    t.boolean "delivery_required"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trains_id"
    t.bigint "pickup_id"
    t.bigint "dropoff_id"
    t.bigint "user_id"
    t.bigint "preferred_shipment"
    t.index ["dropoff_id"], name: "fk_rails_c7bf9203c1"
    t.index ["pickup_id"], name: "fk_rails_5cb3c05d70"
    t.index ["trains_id"], name: "index_requests_on_trains_id"
    t.index ["user_id"], name: "fk_rails_8ead8b1e6b"
  end

  create_table "stations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trains", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "cargo_id"
    t.bigint "departure_station_id"
    t.bigint "arrival_station_id"
    t.time "reception_start_time"
    t.time "extradition_start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arrival_station_id"], name: "fk_rails_865db13bd3"
    t.index ["departure_station_id"], name: "fk_rails_2f88306262"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cargos", "trains"
  add_foreign_key "packages", "items"
  add_foreign_key "packages", "requests"
  add_foreign_key "requests", "dropoffs"
  add_foreign_key "requests", "pickups"
  add_foreign_key "requests", "trains", column: "trains_id"
  add_foreign_key "requests", "users"
  add_foreign_key "trains", "stations", column: "arrival_station_id"
  add_foreign_key "trains", "stations", column: "departure_station_id"
end
