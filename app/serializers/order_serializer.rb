# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :status, :products

  def products
    object.order_products.includes(:product).map do |order_product|
      {
        name: order_product.product.name,
        quantity: order_product.quantity,
        unit_price: order_product.unit_price,
        tax: "#{(order_product.product.tax_rate * 100).to_i}%",
        total_price: order_product.unit_price * order_product.quantity + (order_product.unit_price * order_product.quantity * order_product.product.tax_rate)
      }
    end
  end
end
