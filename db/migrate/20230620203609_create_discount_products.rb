# frozen_string_literal: true

class CreateDiscountProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_products do |t|
      t.references :discount, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
