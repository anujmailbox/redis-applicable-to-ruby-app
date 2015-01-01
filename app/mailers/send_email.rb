class SendEmail < ActionMailer::Base
  default from: "from@example.com"

  def default_email recipients
    mail(to: recipients, subject: "Hi!")
  end
end
