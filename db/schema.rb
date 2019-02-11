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

ActiveRecord::Schema.define(version: 2019_02_11_152111) do

  create_table "breaks", force: :cascade do |t|
    t.string "review"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shelter_id"
    t.integer "user_id"
    t.integer "rating"
    t.index ["shelter_id"], name: "index_breaks_on_shelter_id"
    t.index ["user_id"], name: "index_breaks_on_user_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.integer "rating"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trail_id"
    t.integer "user_id"
    t.index ["trail_id"], name: "index_hikes_on_trail_id"
    t.index ["user_id"], name: "index_hikes_on_user_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trail_id"
    t.index ["trail_id"], name: "index_shelters_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "description"
    t.integer "difficulty_level"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "gear"
    t.string "photo"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
