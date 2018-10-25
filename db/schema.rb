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

ActiveRecord::Schema.define(version: 2018_10_25_153116) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "lift_id"
    t.index ["account_id"], name: "index_drivers_on_account_id"
    t.index ["lift_id"], name: "index_drivers_on_lift_id"
  end

  create_table "lifts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "departure_address"
    t.string "arrival_address"
    t.string "car"
    t.decimal "price", precision: 5, scale: 2
    t.integer "capacity"
    t.datetime "departure_date"
    t.datetime "arrival_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "departure_city"
    t.string "arrival_city"
  end

  create_table "lifts_rules", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "lift_id"
    t.bigint "rule_id"
    t.index ["lift_id"], name: "index_lifts_rules_on_lift_id"
    t.index ["rule_id"], name: "index_lifts_rules_on_rule_id"
  end

  create_table "passengers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "lift_id"
    t.index ["account_id"], name: "index_passengers_on_account_id"
    t.index ["lift_id"], name: "index_passengers_on_lift_id"
  end

  create_table "rules", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drivers", "accounts"
  add_foreign_key "drivers", "lifts"
  add_foreign_key "lifts_rules", "lifts"
  add_foreign_key "lifts_rules", "rules"
  add_foreign_key "passengers", "accounts"
  add_foreign_key "passengers", "lifts"
end
