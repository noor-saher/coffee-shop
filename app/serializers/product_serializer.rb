# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :tax

  def tax
    "#{(object.tax_rate * 100).to_i}%"
  end
end
