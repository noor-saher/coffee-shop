# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :discounts, dependent: :destroy
  validates :name, :price, :tax_rate, presence: true
end
