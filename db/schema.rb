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

ActiveRecord::Schema.define(version: 20140129083228) do

  create_table "accounts", force: true do |t|
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", force: true do |t|
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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

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

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

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

  create_table "orders", force: true do |t|
    t.integer  "vendor_id"
    t.string   "devicename"
    t.string   "devicecarrier"
    t.string   "deviceimei"
    t.string   "ordertotal"
    t.string   "selleraddress"
    t.date     "orderdate"
    t.datetime "ordertime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
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

  create_table "specifications", force: true do |t|
    t.string   "manufacturer"
    t.string   "providers"
    t.string   "speed"
    t.string   "ram"
    t.string   "storage"
    t.string   "microsd"
    t.string   "resolution"
    t.string   "displaysize"
    t.string   "features"
    t.string   "size"
    t.string   "weight"
    t.string   "formfactor"
    t.string   "colors"
    t.string   "megapixels"
    t.string   "camfeatures"
    t.string   "phonetype"
    t.string   "cariiers"
    t.string   "networks"
    t.string   "releasedate"
    t.string   "wifi"
    t.string   "bluetooth"
    t.string   "gps"
    t.string   "fourg"
    t.string   "microusb"
    t.string   "audiojack"
    t.string   "radio"
    t.string   "speakerphone"
    t.string   "lion"
    t.string   "replace"
    t.string   "batreplace"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone_id"
  end

  create_table "trackcodes", force: true do |t|
    t.string   "code"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "votes", force: true do |t|
    t.boolean  "vote",          default: false, null: false
    t.integer  "voteable_id",                   null: false
    t.string   "voteable_type",                 null: false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], name: "fk_one_vote_per_user_per_entity", unique: true
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type"

end
