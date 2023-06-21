# frozen_string_literal: true

class DiscountProduct < ApplicationRecord
  belongs_to :discount
  belongs_to :product
  validates :discount, :product, presence: true

  serialize :product_ids, Array
end
