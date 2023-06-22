# frozen_string_literal: true

class DiscountOrder < ApplicationRecord
  belongs_to :discount
  belongs_to :order
  validates :discount, :order, presence: true
end
