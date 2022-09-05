ActiveRecord::Schema.define(version: 2022_09_04_203320) do

  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "full_name"
    t.bigint "cpf"
    t.string "email"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_contacts_on_cpf", unique: true
    t.index ["email"], name: "index_contacts_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
