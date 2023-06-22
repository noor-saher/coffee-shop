# frozen_string_literal: true

class CreateDiscountOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_orders do |t|
      t.references :discount, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
