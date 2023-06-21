# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  validates :user, :total_amount, :status, presence: true
  accepts_nested_attributes_for :order_products

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
    applicable_discount_products = []
    products.each do |product|
      discount_product = DiscountProduct.where("applicable_product_ids IS NULL OR applicable_product_ids LIKE ?", "%#{product}%")
      applicable_discount_products << discount_product if discount_product.present?
    end

    applicable_discount_products.flatten.each do |discount_product|
      discount = discount_product.discount
      
      case discount.discount_type
      when 'percentage'
        if products.include?(discount_product.product_id)
          order_product = order_products.find { |op| op.product_id == discount_product.product_id }
          discount_amount = order_product.quantity * order_product.unit_price * (discount.value / 100.0)
          order_product.unit_price -= discount_amount
        end
      when 'free'
        self.order_products.build(product_id: discount_product.product_id, quantity: 1, unit_price: 0)
      end
    end
  end
end
