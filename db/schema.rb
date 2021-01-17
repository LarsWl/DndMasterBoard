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

ActiveRecord::Schema.define(version: 2021_01_17_210142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "notes"
    t.string "plot"
    t.bigint "chapter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_acts_on_chapter_id"
  end

  create_table "assets", force: :cascade do |t|
    t.string "file"
    t.string "filename", default: "", null: false
    t.bigint "assetable_id"
    t.string "assetable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.integer "modifier"
    t.bigint "characterized_id"
    t.string "characterized_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "notes", default: "", null: false
    t.string "type"
    t.bigint "act_id"
    t.bigint "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["act_id"], name: "index_characters_on_act_id"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.integer "cost", default: 0, null: false
    t.integer "weight", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.integer "kind", default: 0
    t.bigint "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

end
