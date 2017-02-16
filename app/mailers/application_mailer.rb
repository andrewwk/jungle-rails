class ApplicationMailer < ActionMailer::Base
  default from: "orders@jungle.com"
  layout 'mailer'
end
