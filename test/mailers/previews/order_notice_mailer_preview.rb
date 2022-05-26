# Preview all emails at http://localhost:3000/rails/mailers/order_notifier_mailer
class OrderNoticeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier_mailer/received
  def received
    OrderNoticeMailer.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier_mailer/shipped
  def shipped
    OrderNoticeMailer.shipped
  end

end
