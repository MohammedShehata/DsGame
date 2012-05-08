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

ActiveRecord::Schema.define(:version => 20120508212744) do

  create_table "boards", :force => true do |t|
    t.integer  "game_id"
    t.string   "ele1"
    t.string   "ele2"
    t.string   "ele3"
    t.string   "ele4"
    t.string   "ele5"
    t.string   "ele6"
    t.string   "ele7"
    t.string   "ele8"
    t.string   "ele9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "user1"
    t.integer  "user2"
    t.boolean  "started"
    t.boolean  "ended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
