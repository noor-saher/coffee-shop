# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_230_620_220_230) do
  create_table 'discount_products', force: :cascade do |t|
    t.integer 'discount_id', null: false
    t.integer 'product_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'applicable_product_ids'
    t.index ['discount_id'], name: 'index_discount_products_on_discount_id'
    t.index ['product_id'], name: 'index_discount_products_on_product_id'
  end

  create_table 'discounts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description'
    t.string 'discount_type', null: false
    t.decimal 'value', precision: 10, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'order_products', force: :cascade do |t|
    t.integer 'order_id', null: false
    t.integer 'product_id', null: false
    t.integer 'quantity', null: false
    t.decimal 'unit_price', precision: 10, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_order_products_on_order_id'
    t.index ['product_id'], name: 'index_order_products_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.decimal 'total_amount', precision: 10, scale: 2, null: false
    t.string 'status', default: 'Pending', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'description'
    t.decimal 'price', precision: 10, scale: 2, null: false
    t.decimal 'tax_rate', precision: 10, scale: 2, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'discount_products', 'discounts'
  add_foreign_key 'discount_products', 'products'
  add_foreign_key 'order_products', 'orders'
  add_foreign_key 'order_products', 'products'
  add_foreign_key 'orders', 'users'
end
