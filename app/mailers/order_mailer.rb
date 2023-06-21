# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_ready_email(order)
    @order = order
    mail(to: order.user.email, subject: 'Your order is ready!')
  end
end
  