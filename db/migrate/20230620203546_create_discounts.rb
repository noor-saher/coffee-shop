# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name, null: false
      t.text :description
      t.integer :discount_type, default: 0, null: false
      t.decimal :value, precision: 10, scale: 2, null: false
      t.integer :applicable_product_ids, default: [], array: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
