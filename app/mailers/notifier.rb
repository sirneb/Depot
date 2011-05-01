class Notifier < ActionMailer::Base
  default :from => 'Sam Ruby <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    @is_email = true

    mail :to => order.email, :subject => "Pragmatic Store Order Number #{order.id} Shipped"
    @is_email = false
  end
end
