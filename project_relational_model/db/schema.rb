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

ActiveRecord::Schema.define(:version => 20130326134911) do

  create_table "assignments", :force => true do |t|
    t.integer  "programmer_id"
    t.integer  "project_id"
    t.decimal  "hours_worked",  :precision => 10, :scale => 0
    t.text     "task"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "programmers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.decimal  "hourly_rate", :precision => 10, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "programmers_programming_languages", :id => false, :force => true do |t|
    t.integer "programmer_id",           :null => false
    t.integer "programming_language_id", :null => false
  end

  add_index "programmers_programming_languages", ["programmer_id", "programming_language_id"], :name => "programmers_languages", :unique => true

  create_table "programming_languages", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "due_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
