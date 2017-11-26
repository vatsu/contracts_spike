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

ActiveRecord::Schema.define(version: 20171126174557) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_people", id: false, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "person_id", null: false
    t.index ["company_id", "person_id"], name: "index_companies_people_on_company_id_and_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "segment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "required_document_id"
    t.index ["name", "segment"], name: "index_products_on_name_and_segment", unique: true
    t.index ["required_document_id"], name: "index_products_on_required_document_id"
  end

  create_table "required_documents", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
