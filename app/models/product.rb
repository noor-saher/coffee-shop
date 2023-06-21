# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :discount_products, dependent: :destroy
  has_many :discounts, through: :discount_products, dependent: :destroy
  validates :name, :price, :tax_rate, presence: true
end
