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

ActiveRecord::Schema.define(version: 20140507185734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_type_id"
    t.decimal  "bank_balance",     precision: 8, scale: 2, default: 0.0
    t.datetime "last_txn_added"
    t.datetime "last_txn_cleared"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "current_balance",  precision: 8, scale: 2, default: 0.0
  end

  add_index "accounts", ["account_type_id"], name: "index_accounts_on_account_type_id", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "spend_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "transaction_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
  end

  create_table "transactions", force: true do |t|
    t.integer  "account_id"
    t.integer  "transaction_type_id"
    t.date     "transaction_date"
    t.string   "to_or_from"
    t.decimal  "amount",              precision: 8, scale: 2
    t.integer  "spend_category_id"
    t.string   "note"
    t.boolean  "cleared",                                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree
  add_index "transactions", ["spend_category_id"], name: "index_transactions_on_spend_category_id", using: :btree
  add_index "transactions", ["transaction_type_id"], name: "index_transactions_on_transaction_type_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

end
