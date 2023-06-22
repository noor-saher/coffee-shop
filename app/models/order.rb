# frozen_string_literal: true

class Order < ApplicationRecord
  attribute :applicable_product_ids, :integer, array: true, default: []

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :discount_orders, dependent: :destroy
  has_many :discounts, through: :discount_orders, dependent: :destroy
  validates :user, :total_amount, :status, presence: true
  accepts_nested_attributes_for :order_products
  enum status: [:pending, :accepted, :completed]

  def process_order
    order_products.each(&:set_unit_price)
    apply_discounts
    calculate_total_amount
  end

  def calculate_total_amount
    subtotal = order_products.sum { |product| product.quantity * product.unit_price }
    tax_amount = order_products.sum { |product| product.quantity * product.unit_price * product.product.tax_rate }
    self.total_amount = subtotal + tax_amount
  end
  
  def apply_discounts
    products = order_products.collect(&:product_id)
    applicable_discounts = Discount.where("applicable_product_ids && ARRAY[?]::integer[]", products)

    applicable_discounts.each do |discount|
      case discount.discount_type
      when 'percentage'
        if products.include?(discount.product_id)
          order_product = order_products.find { |op| op.product_id == discount.product_id }
          discount_amount = order_product.quantity * order_product.unit_price * (discount.value / 100.0)
          order_product.unit_price -= discount_amount
          self.discount_orders.build(discount: discount)
        end
      when 'free'
        self.order_products.build(product_id: discount.product_id, quantity: 1, unit_price: 0)
        self.discount_orders.build(discount: discount)
      end
    end
  end
end
