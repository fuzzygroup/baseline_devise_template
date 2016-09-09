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

ActiveRecord::Schema.define(version: 20160908124127) do

  create_table "site_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "date_created_at"
    t.integer  "site_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.index ["site_id", "user_id"], name: "index_site_users_on_site_id_and_user_id", using: :btree
    t.index ["user_id", "site_id"], name: "index_site_users_on_user_id_and_site_id", using: :btree
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "date_created_at"
    t.string   "c_name"
    t.string   "name"
    t.string   "description"
    t.string   "icon_url"
    t.string   "state"
    t.index ["c_name", "state"], name: "index_sites_on_c_name_and_state", using: :btree
  end

  create_table "source_expressions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "source_id"
    t.string   "expression"
    t.index ["site_id", "user_id"], name: "index_source_expressions_on_site_id_and_user_id", using: :btree
    t.index ["source_id", "site_id"], name: "index_source_expressions_on_source_id_and_site_id", using: :btree
    t.index ["user_id", "site_id"], name: "index_source_expressions_on_user_id_and_site_id", using: :btree
  end

  create_table "sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "date_created_at"
    t.datetime "last_checked_at"
    t.integer  "state"
    t.integer  "site_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "source_type"
    t.string   "url"
    t.string   "scope"
    t.text     "http_statuses",     limit: 65535
    t.text     "filter_expression", limit: 65535
    t.string   "index_context"
    t.string   "domain"
    t.string   "search_terms"
    t.string   "search_url"
    t.index ["site_id", "user_id"], name: "index_sources_on_site_id_and_user_id", using: :btree
    t.index ["user_id", "site_id"], name: "index_sources_on_user_id_and_site_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",               default: "",       null: false
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_type",              default: "normal"
    t.boolean  "active",                 default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
