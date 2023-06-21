# frozen_string_literal: true

module Api
  module V1
    class ProductsController < Api::V1::BaseApiController
      before_action :set_product, only: :show

      def index
        products = Product.all
        serialized_products = ActiveModelSerializers::SerializableResource.new(products,
                                                                               each_serializer: ProductSerializer).serializable_hash
        render json: serialized_products
      end

      def show
        render json: ProductSerializer.new(@product).serializable_hash
      end

      private

      def set_product
        @product = Product.find(params[:id])
      end
    end
  end
end
