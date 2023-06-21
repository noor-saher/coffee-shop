# frozen_string_literal: true

class OrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    OrderMailer.order_ready_email(order).deliver_now
  end
end
  