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

ActiveRecord::Schema.define(version: 2023_04_11_135446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labelings", force: :cascade do |t|
    t.bigint "sake_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["label_id"], name: "index_labelings_on_label_id"
    t.index ["sake_id"], name: "index_labelings_on_sake_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "feature"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sakes", force: :cascade do |t|
    t.string "name", null: false
    t.text "content", null: false
    t.string "place", null: false
    t.integer "sweetness", null: false
    t.integer "flavor", null: false
    t.integer "sour", null: false
    t.integer "feeling", null: false
    t.integer "rich", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "labelings", "labels"
  add_foreign_key "labelings", "sakes"
end