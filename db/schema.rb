# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_022904) do

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.integer "band_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "concerts", force: :cascade do |t|
    t.date "date"
    t.integer "admission"
    t.integer "band_id", null: false
    t.integer "venue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_concerts_on_band_id"
    t.index ["venue_id"], name: "index_concerts_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.integer "band_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_users_on_band_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "crowd_capacity"
    t.boolean "parking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "city"
    t.string "state"
  end

  add_foreign_key "concerts", "bands"
  add_foreign_key "concerts", "venues"
  add_foreign_key "users", "bands"
end
