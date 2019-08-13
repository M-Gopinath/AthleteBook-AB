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

ActiveRecord::Schema.define(version: 20160920125917) do

  create_table "account_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.boolean  "is_active"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "album_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "athlete_skills", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "auth_tokens", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string   "year",        limit: 255
    t.string   "description", limit: 255
    t.string   "carrer_name", limit: 255
    t.string   "career_file", limit: 255
    t.string   "user_id",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "state_id",   limit: 4
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "education_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "period",            limit: 255
    t.string   "course_of_study",   limit: 255
    t.string   "activities",        limit: 255
    t.string   "descripition",      limit: 255
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "institution_id",    limit: 4
    t.integer  "education_type_id", limit: 4
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "skills",      limit: 255
    t.string   "club_name",   limit: 255
    t.string   "location",    limit: 255
    t.string   "time_perid",  limit: 255
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "payment_histories", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "payment_type", limit: 255
    t.string   "amount",       limit: 255
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "album_id",   limit: 4
    t.string   "pic_upload", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "plan_periods", force: :cascade do |t|
    t.integer  "plan_id",     limit: 4
    t.integer  "month",       limit: 4
    t.float    "cost",        limit: 24
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "price",       limit: 255
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.boolean  "is_active"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "country_id", limit: 4
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_plans", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "plan_id",      limit: 4
    t.float    "amount",       limit: 24
    t.string   "payment_type", limit: 255
    t.datetime "expiry_date"
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "phone",        limit: 255
    t.string   "sports_name",  limit: 255
    t.text     "address",      limit: 65535
    t.string   "college",      limit: 255
    t.float    "exp",          limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "public_image", limit: 255
    t.string   "cover_image",  limit: 255
    t.string   "description",  limit: 255
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.integer  "plan_id",        limit: 4
    t.integer  "plan_period_id", limit: 4
    t.datetime "renewal_date"
    t.datetime "expiry_date"
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_videos", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "user_video", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.integer  "role_id",                limit: 4
    t.integer  "account_type_id",        limit: 4
    t.string   "gender",                 limit: 255
    t.datetime "date_of_birth"
    t.string   "country_id",             limit: 255
    t.boolean  "is_active",                          default: false, null: false
    t.integer  "plan_id",                limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "stripe_account_id",      limit: 255
    t.string   "company_name",           limit: 255
    t.string   "company_logo",           limit: 255
    t.string   "team_name",              limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
