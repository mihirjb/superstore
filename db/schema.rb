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

ActiveRecord::Schema.define(version: 20150117040135) do

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
    t.integer  "user_id"
    t.integer  "listing_id"
    t.string   "status"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "description"
    t.integer  "askprice"
    t.date     "expirydate"
    t.boolean  "modified"
    t.string   "accessories"
    t.string   "country"
    t.string   "itemlocation"
    t.boolean  "shipinternationally"
    t.boolean  "paypalconfirmed"
    t.boolean  "returnsallowed"
    t.text     "returnspolicy"
    t.integer  "user_id"
    t.string   "paypalemail"
    t.string   "devicename"
    t.string   "devicestorage"
    t.string   "devicecarrier"
    t.string   "deviceimei"
    t.string   "devicecolor"
    t.string   "shippingdetails"
    t.string   "status"
    t.integer  "phone_id"
    t.string   "terms"
    t.string   "moddetails"
    t.string   "paypalstatus"
    t.string   "paypalfname"
    t.string   "paypallname"
    t.integer  "impressions_count"
    t.string   "accounttype"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "devicecondition"
    t.string   "deliveryby"
    t.string   "pickupaddress"
    t.string   "returnpolicy"
  end

  create_table "opro_auth_grants", force: true do |t|
    t.string   "code"
    t.string   "access_token"
    t.string   "refresh_token"
    t.text     "permissions"
    t.datetime "access_token_expires_at"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opro_auth_grants", ["access_token"], name: "index_opro_auth_grants_on_access_token", unique: true
  add_index "opro_auth_grants", ["code"], name: "index_opro_auth_grants_on_code", unique: true
  add_index "opro_auth_grants", ["refresh_token"], name: "index_opro_auth_grants_on_refresh_token", unique: true

  create_table "opro_client_apps", force: true do |t|
    t.string   "name"
    t.string   "app_id"
    t.string   "app_secret"
    t.text     "permissions"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opro_client_apps", ["app_id", "app_secret"], name: "index_opro_client_apps_on_app_id_and_app_secret", unique: true
  add_index "opro_client_apps", ["app_id"], name: "index_opro_client_apps_on_app_id", unique: true

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "devicename"
    t.string   "devicecarrier"
    t.string   "deviceimei"
    t.string   "ordertotal"
    t.string   "selleraddress"
    t.date     "orderdate"
    t.datetime "ordertime"
    t.integer  "seller_id"
    t.text     "shipping_address"
    t.integer  "pptransactionid"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
  end

  create_table "phones", force: true do |t|
    t.string   "modelname"
    t.integer  "impressions_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "phonetype"
    t.string   "company"
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
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
  end

  create_table "reviews", force: true do |t|
    t.integer  "author_id"
    t.text     "reviewbody"
    t.boolean  "thumbsup"
    t.integer  "profile_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackcodes", force: true do |t|
    t.string   "code"
    t.integer  "order_id"
    t.string   "shipping_company"
    t.date     "shipping_date"
    t.string   "shipping_city"
    t.string   "shippingto_city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "firstname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

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
