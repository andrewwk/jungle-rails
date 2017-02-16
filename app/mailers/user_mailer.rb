class UserMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  default from: 'orders@junglerails.com'

  def email_receipt(order)
    @order = order
    @url  = 'http://jungle-rails.com/orders'
    mail(to: @order.email, subject: 'Jungle Rails: Order Confirmation')
  end
end
