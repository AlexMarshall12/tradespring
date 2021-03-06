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

ActiveRecord::Schema.define(:version => 20121110005903) do

  create_table "pcomments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "purchase_id"
    t.string   "body",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pcomments", ["user_id", "purchase_id"], :name => "index_pcomments_on_user_id_and_purchase_id"

  create_table "purchases", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  add_index "purchases", ["user_id", "created_at"], :name => "index_purchases_on_user_id_and_created_at"

  create_table "sales", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  add_index "sales", ["user_id", "created_at"], :name => "index_sales_on_user_id_and_created_at"

  create_table "scomments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sale_id"
    t.string   "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scomments", ["user_id", "sale_id"], :name => "index_scomments_on_user_id_and_sale_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
