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

ActiveRecord::Schema.define(version: 2021_02_04_205117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "act_characters", force: :cascade do |t|
    t.bigint "act_id"
    t.bigint "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["act_id"], name: "index_act_characters_on_act_id"
    t.index ["character_id"], name: "index_act_characters_on_character_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "acts", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.string "notes"
    t.string "plot"
    t.integer "position"
    t.bigint "chapter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_acts_on_chapter_id"
  end

  create_table "campaign_members", force: :cascade do |t|
    t.integer "role", default: 0, null: false
    t.bigint "campaign_id"
    t.bigint "user_id"
    t.bigint "character_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_campaign_members_on_campaign_id"
    t.index ["character_id"], name: "index_campaign_members_on_character_id"
    t.index ["user_id"], name: "index_campaign_members_on_user_id"
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
    t.integer "position"
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
    t.bigint "user_id"
    t.index ["act_id"], name: "index_characters_on_act_id"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
  end

  create_table "combat_skills", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: ""
    t.integer "hit_modifier", default: 0
    t.string "damage", default: ""
    t.bigint "character_id"
    t.string "character_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description"
    t.integer "cost", default: 0, null: false
    t.integer "weight", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.boolean "approved", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id", "user_id"], name: "index_friendships_on_friend_id_and_user_id", unique: true
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
  end

  create_table "main_characteristics", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.string "modifier"
    t.string "label"
    t.integer "position"
    t.integer "code"
    t.bigint "characterized_id"
    t.string "characterized_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "player_skills", force: :cascade do |t|
    t.string "name"
    t.integer "modifier", default: 0, null: false
    t.boolean "proficiency", default: false
    t.bigint "character_id"
    t.bigint "main_characteristic_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_player_skills_on_character_id"
    t.index ["main_characteristic_id"], name: "index_player_skills_on_main_characteristic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
