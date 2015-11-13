# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150925180211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string   "hero_name"
    t.string   "img_url"
    t.string   "roles"
    t.string   "char_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hats", force: :cascade do |t|
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "img_url"
    t.string   "cost"
    t.string   "notes"
    t.string   "lore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.boolean  "radiant_win"
    t.integer  "duration"
    t.integer  "start_time",              limit: 8
    t.integer  "match_id",                limit: 8
    t.integer  "match_seq_num",           limit: 8
    t.integer  "tower_status_radiant"
    t.integer  "tower_status_dire"
    t.integer  "barracks_status_radiant"
    t.integer  "barracks_status_dire"
    t.integer  "cluster"
    t.integer  "first_blood_time"
    t.integer  "lobby_type"
    t.integer  "human_players"
    t.integer  "leagueid"
    t.integer  "positive_votes"
    t.integer  "negative_votes"
    t.integer  "game_mode"
    t.integer  "engine"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "account_id",   limit: 8
    t.integer  "player_slot"
    t.integer  "hero_id"
    t.integer  "item_0"
    t.integer  "item_1"
    t.integer  "item_2"
    t.integer  "item_3"
    t.integer  "item_4"
    t.integer  "item_5"
    t.integer  "kills"
    t.integer  "deaths"
    t.integer  "assists"
    t.integer  "leaver_st"
    t.integer  "gold"
    t.integer  "last_hits"
    t.integer  "denies"
    t.integer  "gold_per_min"
    t.integer  "xp_per_min"
    t.integer  "gold_spent"
    t.integer  "hero_damage"
    t.integer  "tower_damage"
    t.integer  "hero_heal"
    t.integer  "end_level"
    t.text     "levels",                 default: [],              array: true
    t.text     "abilities",              default: [],              array: true
    t.text     "time",                   default: [],              array: true
    t.integer  "match_id"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "players", ["match_id"], name: "index_players_on_match_id", using: :btree
  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "skype_id"
    t.string   "steam_id"
    t.integer  "solo_mmr"
    t.integer  "party_mmr"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "players", "matches"
end
