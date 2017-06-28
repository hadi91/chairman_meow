# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/update_order_status
  def update_order_status
    OrderMailerMailer.update_order_status
  end

end
