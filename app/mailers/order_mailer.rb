class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.update_order_status.subject
  #
  def update_order_status(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order has been updated')
  end

  # def order_confirmation(order)
  #   @order = order
  #   mail(to: @order.user.email, subject: 'Order Confirmation from Chairman Meow')
  # end
end
