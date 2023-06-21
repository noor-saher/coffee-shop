# frozen_string_literal: true

module Api
  module V1
    class BaseApiController < ApplicationController
      protect_from_forgery with: :null_session

      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      def not_found
        render json: {
          'errors': [
            {
              'status': '404',
              'title': 'Not Found'
            }
          ]
        }, status: 404
      end
    end
  end
end
