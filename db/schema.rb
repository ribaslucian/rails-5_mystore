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

ActiveRecord::Schema.define(version: 20161027152825) do

  create_table "addresses", force: :cascade do |t|
    t.string   "id_ns",        limit: 64,              null: false
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority",     limit: 2,   default: 1, null: false
    t.string   "type",         limit: 32
    t.string   "zipcode",      limit: 14
    t.string   "street",       limit: 124
    t.string   "neighborhood", limit: 64
    t.integer  "number",       limit: 8
    t.string   "complement",   limit: 124
    t.string   "city",         limit: 64
    t.string   "state",        limit: 64
    t.string   "country",      limit: 64
    t.index ["entity_id"], name: "index_addresses_on_entity_id"
    t.index ["id_ns"], name: "index_addresses_on_id_ns"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "id_ns",       limit: 64, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.string   "sufix"
    t.text     "description"
    t.index ["id_ns"], name: "index_categories_on_id_ns"
  end

  create_table "categories_products", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "product_id"
    t.index ["category_id"], name: "index_categories_products_on_category_id"
    t.index ["product_id"], name: "index_categories_products_on_product_id"
  end

  create_table "corporates", force: :cascade do |t|
    t.string   "id_ns",                  limit: 64,  null: false
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cnpj",                   limit: 18
    t.string   "corporate_name",         limit: 124
    t.string   "registration_municipal", limit: 16
    t.string   "registration_state",     limit: 16
    t.index ["entity_id"], name: "index_corporates_on_entity_id"
    t.index ["id_ns"], name: "index_corporates_on_id_ns"
  end

  create_table "emails", force: :cascade do |t|
    t.string   "id_ns",       limit: 64,              null: false
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",       limit: 124,             null: false
    t.integer  "priority",    limit: 2,   default: 1, null: false
    t.string   "description", limit: 256
    t.index ["entity_id"], name: "index_emails_on_entity_id"
    t.index ["id_ns"], name: "index_emails_on_id_ns"
  end

  create_table "entities", force: :cascade do |t|
    t.string   "id_ns",      limit: 64,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 124
    t.boolean  "is_juridic"
    t.index ["id_ns"], name: "index_entities_on_id_ns"
  end

  create_table "images", force: :cascade do |t|
    t.string   "id_ns",               limit: 64, null: false
    t.integer  "product_id"
    t.integer  "entity_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["entity_id"], name: "index_images_on_entity_id"
    t.index ["id_ns"], name: "index_images_on_id_ns"
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "id_ns",      limit: 64, null: false
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cpf",        limit: 14
    t.string   "rg",         limit: 14
    t.index ["entity_id"], name: "index_people_on_entity_id"
    t.index ["id_ns"], name: "index_people_on_id_ns"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "id_ns",       limit: 64,              null: false
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",       limit: 32,              null: false
    t.integer  "priority",    limit: 2,   default: 1, null: false
    t.string   "description", limit: 256
    t.index ["entity_id"], name: "index_phones_on_entity_id"
    t.index ["id_ns"], name: "index_phones_on_id_ns"
  end

  create_table "products", force: :cascade do |t|
    t.string   "id_ns",       limit: 64,                          null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "code",        limit: 32,                          null: false
    t.string   "name",        limit: 48,                          null: false
    t.decimal  "price",                  precision: 12, scale: 2
    t.decimal  "weight",                 precision: 6,  scale: 3
    t.string   "warranty",    limit: 16
    t.integer  "stock"
    t.text     "description"
    t.index ["code"], name: "index_products_on_code"
    t.index ["id_ns"], name: "index_products_on_id_ns"
    t.index ["name"], name: "index_products_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "id_ns",                   limit: 64,              null: false
    t.integer  "entity_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                    limit: 64
    t.string   "email",                   limit: 92, default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "socialpage"
    t.string   "socialpage_access_token"
    t.string   "socialpage_uid"
    t.string   "socialpage_photo_url"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["entity_id"], name: "index_users_on_entity_id"
    t.index ["id_ns"], name: "index_users_on_id_ns"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
