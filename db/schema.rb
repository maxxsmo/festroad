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

ActiveRecord::Schema.define(version: 2019_03_12_163346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "fest_locations", force: :cascade do |t|
    t.bigint "fest_id"
    t.bigint "location_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fest_id"], name: "index_fest_locations_on_fest_id"
    t.index ["location_type_id"], name: "index_fest_locations_on_location_type_id"
  end

  create_table "fests", force: :cascade do |t|
    t.citext "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "address"
    t.text "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_types", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "music_types", force: :cascade do |t|
    t.string "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "music_type_id"
    t.bigint "fest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fest_id"], name: "index_tags_on_fest_id"
    t.index ["music_type_id"], name: "index_tags_on_music_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.text "description"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "fest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fest_id"], name: "index_wish_lists_on_fest_id"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

end
