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

ActiveRecord::Schema.define(version: 20140113020205) do

  create_table "accounts", force: true do |t|
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: true do |t|
    t.integer  "listing_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "subject"
    t.text     "commentbody"
    t.integer  "vendor_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "listings", force: true do |t|
    t.string   "headline"
    t.text     "description"
    t.string   "devicecondition"
    t.integer  "askprice"
    t.date     "expirydate"
    t.boolean  "modified"
    t.string   "accessories"
    t.string   "country"
    t.string   "itemlocation"
    t.boolean  "shipinternationally"
    t.boolean  "paypalconfirmed"
    t.boolean  "returnsallowed"
    t.text     "returnpolicy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.string   "paypalemail"
    t.string   "devicename"
    t.string   "devicecarrier"
    t.string   "deviceimei"
    t.string   "devicecolor"
    t.string   "devicestorage"
    t.string   "shippingdetails"
    t.string   "status"
    t.integer  "phone_id"
    t.string   "terms"
  end

  create_table "phones", force: true do |t|
    t.string   "modelname"
    t.string   "carrier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "fullname"
    t.string   "paypalemail"
    t.string   "displayname"
    t.string   "timezone"
    t.string   "country"
    t.string   "market"
    t.string   "location"
    t.string   "aboutme"
    t.string   "twitterhandle"
    t.string   "websiteurl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vendor_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "author_id"
    t.text     "reviewbody"
    t.boolean  "thumbsup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

  create_table "vendors", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true

  create_table "views", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["email"], name: "index_views_on_email", unique: true
  add_index "views", ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true

end
