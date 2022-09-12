ActiveRecord::Schema[7.0].define(version: 2022_09_12_082047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_transactions", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_category_transactions_on_category_id"
    t.index ["transaction_id"], name: "index_category_transactions_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_transactions", "categories"
  add_foreign_key "category_transactions", "transactions"
  add_foreign_key "transactions", "users"
end
