# frozen_string_literal: true

class AddApplicableProductIDsToDiscountProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :discount_products, :applicable_product_ids, :text
  end
end
