# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name, null: false
      t.text :description
      t.string :discount_type, null: false
      t.decimal :value, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
