# frozen_string_literal: true

class Discount < ApplicationRecord
  belongs_to :product, dependent: :destroy
  has_many :discount_orders, dependent: :destroy
  has_many :orders, through: :discount_orders, dependent: :destroy
  validates :name, :discount_type, :value, :product, presence: true
  enum discount_type: [:free, :percentage]
end
