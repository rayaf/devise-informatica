# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_15_180817) do

  create_table "graphic_cards", force: :cascade do |t|
    t.string "product"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "product"
    t.integer "supported_processor"
    t.integer "memory_slots"
    t.integer "max_ram"
    t.boolean "onboard_vga"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "processor_id", null: false
    t.integer "motherboard_id", null: false
    t.integer "graphic_card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["graphic_card_id"], name: "index_orders_on_graphic_card_id"
    t.index ["motherboard_id"], name: "index_orders_on_motherboard_id"
    t.index ["processor_id"], name: "index_orders_on_processor_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "product"
    t.integer "brand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ram_memories", force: :cascade do |t|
    t.string "product"
    t.integer "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ram_slots", force: :cascade do |t|
    t.integer "ram_memory_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_ram_slots_on_order_id"
    t.index ["ram_memory_id"], name: "index_ram_slots_on_ram_memory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "graphic_cards"
  add_foreign_key "orders", "motherboards"
  add_foreign_key "orders", "processors"
  add_foreign_key "orders", "users"
  add_foreign_key "ram_slots", "orders"
  add_foreign_key "ram_slots", "ram_memories"
end
