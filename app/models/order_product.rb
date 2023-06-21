# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, :product, :quantity, :unit_price, presence: true

  def set_unit_price
    self.unit_price ||= product.price
  end
end
