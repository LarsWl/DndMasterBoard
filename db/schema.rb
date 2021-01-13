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

ActiveRecord::Schema.define(version: 2021_01_13_185705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "notes"
    t.bigint "chapter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_acts_on_chapter_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "history"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "notes"
    t.bigint "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_chapters_on_campaign_id"
  end

  create_table "not_playable_characters", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "history"
    t.string "notes"
    t.string "characteristics"
    t.string "skills"
    t.bigint "campaign_id"
    t.bigint "act_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["act_id"], name: "index_not_playable_characters_on_act_id"
    t.index ["campaign_id"], name: "index_not_playable_characters_on_campaign_id"
  end

end
