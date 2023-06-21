# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  validates :user, :total_amount, :status, presence: true
  accepts_nested_attributes_for :order_products
end
