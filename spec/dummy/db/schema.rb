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

ActiveRecord::Schema.define(version: 2018_06_18_162304) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "m_terms", force: :cascade do |t|
    t.string "term"
    t.string "meaning"
    t.string "spelling"
    t.integer "gid"
    t.string "level"
    t.bigint "shuffling", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gid"], name: "index_m_terms_on_gid"
    t.index ["level"], name: "index_m_terms_on_level"
    t.index ["meaning"], name: "index_m_terms_on_meaning"
    t.index ["shuffling"], name: "index_m_terms_on_shuffling"
    t.index ["spelling"], name: "index_m_terms_on_spelling"
    t.index ["term"], name: "index_m_terms_on_term"
  end

  create_table "phrases", force: :cascade do |t|
    t.integer "recipient_id"
    t.string "term"
    t.string "meaning"
    t.string "spelling"
    t.integer "gid"
    t.string "level"
    t.bigint "shuffling", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gid"], name: "index_phrases_on_gid"
    t.index ["level"], name: "index_phrases_on_level"
    t.index ["meaning"], name: "index_phrases_on_meaning"
    t.index ["recipient_id"], name: "index_phrases_on_recipient_id"
    t.index ["shuffling"], name: "index_phrases_on_shuffling"
    t.index ["spelling"], name: "index_phrases_on_spelling"
    t.index ["term"], name: "index_phrases_on_term"
  end

  create_table "phrases_terms", id: false, force: :cascade do |t|
    t.integer "phrase_id", null: false
    t.integer "term_id", null: false
    t.index ["phrase_id", "term_id"], name: "index_phrases_terms_on_phrase_id_and_term_id", unique: true
    t.index ["term_id", "phrase_id"], name: "index_phrases_terms_on_term_id_and_phrase_id", unique: true
  end

  create_table "recipients", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.text "raw_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_recipients_on_uid", unique: true
  end

  create_table "terms", force: :cascade do |t|
    t.string "term"
    t.string "meaning"
    t.string "spelling"
    t.integer "gid"
    t.string "level"
    t.bigint "shuffling", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gid"], name: "index_terms_on_gid"
    t.index ["level"], name: "index_terms_on_level"
    t.index ["meaning"], name: "index_terms_on_meaning"
    t.index ["shuffling"], name: "index_terms_on_shuffling"
    t.index ["spelling"], name: "index_terms_on_spelling"
    t.index ["term"], name: "index_terms_on_term"
  end

end
