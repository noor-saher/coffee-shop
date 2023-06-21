# frozen_string_literal: true

class Discount < ApplicationRecord
  has_many :discount_products, dependent: :destroy
  has_many :products, through: :discount_products, dependent: :destroy
  validates :name, :discount_type, :value, presence: true
end
