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

ActiveRecord::Schema.define(version: 20140622211234) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "amenities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audiences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_events", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "calendar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calendar_events", ["calendar_id"], name: "index_calendar_events_on_calendar_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "zoom"
    t.boolean  "inactive",   default: true
  end

  create_table "feature_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.integer  "feature_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "features", ["feature_type_id"], name: "index_features_on_feature_type_id"

  create_table "place_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "place_types", ["name"], name: "index_place_types_on_name", unique: true

  create_table "places", force: true do |t|
    t.string   "name"
    t.integer  "place_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "zoom"
    t.boolean  "inactive",      default: true
  end

  add_index "places", ["region_id"], name: "index_places_on_region_id"

  create_table "plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_type_id"
    t.integer  "region_id"
    t.integer  "country_id"
    t.integer  "bedrooms"
    t.integer  "capacity"
    t.integer  "place_id"
    t.string   "promo_image_file_name"
    t.string   "promo_image_content_type"
    t.integer  "promo_image_file_size"
    t.datetime "promo_image_updated_at"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "promo_video_file_name"
    t.string   "promo_video_content_type"
    t.integer  "promo_video_file_size"
    t.datetime "promo_video_updated_at"
    t.integer  "audience_id"
    t.text     "summary"
  end

  add_index "properties", ["audience_id"], name: "index_properties_on_audience_id"
  add_index "properties", ["country_id"], name: "index_properties_on_country_id"
  add_index "properties", ["property_type_id"], name: "index_properties_on_property_type_id"
  add_index "properties", ["region_id"], name: "index_properties_on_region_id"
  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "property_assets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "property_id"
    t.string   "description"
    t.boolean  "private"
    t.string   "asset_type"
  end

  add_index "property_assets", ["asset_type"], name: "index_property_assets_on_asset_type"
  add_index "property_assets", ["property_id"], name: "index_property_assets_on_property_id"

  create_table "property_calendars", force: true do |t|
    t.string   "name"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_calendars", ["property_id"], name: "index_property_calendars_on_property_id"

  create_table "property_features", force: true do |t|
    t.integer  "property_id"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_features", ["feature_id"], name: "index_property_features_on_feature_id"
  add_index "property_features", ["property_id"], name: "index_property_features_on_property_id"

  create_table "property_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_types", ["name"], name: "index_property_types_on_name", unique: true

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "zoom"
    t.boolean  "inactive",   default: true
  end

  add_index "regions", ["country_id"], name: "index_regions_on_country_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "plan_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["plan_id"], name: "index_users_on_plan_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
