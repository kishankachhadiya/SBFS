# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_19_112651) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "conditions", force: :cascade do |t|
    t.string "condition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conditions_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "condition_id", null: false
    t.index ["condition_id"], name: "index_conditions_listings_on_condition_id"
    t.index ["listing_id"], name: "index_conditions_listings_on_listing_id"
  end

  create_table "hulls", force: :cascade do |t|
    t.string "hull"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hulls_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "hull_id", null: false
    t.index ["hull_id"], name: "index_hulls_listings_on_hull_id"
    t.index ["listing_id"], name: "index_hulls_listings_on_listing_id"
  end

  create_table "kind_of_boats", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kind_of_boats_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "kind_of_boat_id", null: false
    t.index ["kind_of_boat_id"], name: "index_kind_of_boats_listings_on_kind_of_boat_id"
    t.index ["listing_id"], name: "index_kind_of_boats_listings_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "equipment"
    t.string "model"
    t.integer "length"
    t.integer "beam"
    t.integer "draft"
    t.integer "displacement"
    t.integer "year"
    t.integer "cabins"
    t.integer "berths"
    t.string "engine"
    t.string "fuel"
    t.integer "hours"
    t.integer "horsepower"
    t.string "location"
    t.integer "zip_code"
    t.string "public_name"
    t.string "email"
    t.string "phone_number"
    t.date "published"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price"
    t.boolean "featured"
  end

  create_table "listings_manufacturers", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "manufacturer_id", null: false
    t.index ["listing_id"], name: "index_listings_manufacturers_on_listing_id"
    t.index ["manufacturer_id"], name: "index_listings_manufacturers_on_manufacturer_id"
  end

  create_table "listings_materials", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "material_id", null: false
    t.index ["listing_id"], name: "index_listings_materials_on_listing_id"
    t.index ["material_id"], name: "index_listings_materials_on_material_id"
  end

  create_table "listings_riggings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "rigging_id", null: false
    t.index ["listing_id"], name: "index_listings_riggings_on_listing_id"
    t.index ["rigging_id"], name: "index_listings_riggings_on_rigging_id"
  end

  create_table "listings_states", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "state_id", null: false
    t.index ["listing_id"], name: "index_listings_states_on_listing_id"
    t.index ["state_id"], name: "index_listings_states_on_state_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "material"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "riggings", force: :cascade do |t|
    t.string "rigging"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
