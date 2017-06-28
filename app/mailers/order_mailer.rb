class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.update_order_status.subject
  #
  def update_order_status
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
