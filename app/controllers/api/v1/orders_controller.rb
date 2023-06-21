# frozen_string_literal: true

module Api
  module V1
    class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token, only: :create

      def create
        order_params = params.require(:order).permit(:user_id, order_products_attributes: %i[product_id quantity])
        order = Order.new(order_params)

        order.process_order

        if order.save
          render json: OrderSerializer.new(order).serializable_hash, status: :created
        else
          render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
