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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130719152010) do

  create_table "bonus", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "family"
    t.integer  "set",        :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "bonus", ["slug"], :name => "index_bonus_on_slug", :unique => true

  create_table "checkpoints", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "cp_index"
    t.integer  "world_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "level_id"
    t.integer  "link_to_world_id"
    t.integer  "kind",             :default => 0
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "user_agent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_data", :force => true do |t|
    t.integer "level_id"
    t.integer "user_id"
    t.integer "star_count"
    t.integer "time"
    t.integer "status"
    t.string  "user_agent"
    t.string  "uuid"
  end

  create_table "games", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "sizing_mode"
    t.integer  "width"
    t.integer  "height"
  end

  add_index "games", ["slug"], :name => "index_games_on_slug", :unique => true

  create_table "level_bonus", :force => true do |t|
    t.integer  "level_id"
    t.integer  "bonu_id"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "level_sprites", :force => true do |t|
    t.integer  "level_id"
    t.integer  "sprite_id"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "level_tiles", :force => true do |t|
    t.integer  "level_id"
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "levels", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.integer  "tile_count_x", :default => 20
    t.integer  "tile_count_y", :default => 20
    t.integer  "world_id"
    t.integer  "set",          :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "level_index"
    t.integer  "speed",        :default => 100
  end

  add_index "levels", ["slug"], :name => "index_levels_on_slug", :unique => true

  create_table "options", :force => true do |t|
    t.integer  "sprite_id"
    t.string   "label"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bonu_id"
    t.integer  "level_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["slug"], :name => "index_roles_on_slug", :unique => true

  create_table "sprites", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "family"
    t.integer  "set",               :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "helping_sprite_id"
  end

  add_index "sprites", ["slug"], :name => "index_sprites_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "slug"
    t.string   "password_digest"
    t.integer  "high_score"
    t.integer  "high_level"
    t.integer  "role_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "game_progress"
    t.integer  "highscore",       :default => 0
  end

  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "worlds", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "grid_width",       :default => 20
    t.integer  "grid_height",      :default => 20
    t.integer  "world_index"
    t.string   "background_color"
    t.string   "hint"
  end

  add_index "worlds", ["slug"], :name => "index_worlds_on_slug", :unique => true

end
