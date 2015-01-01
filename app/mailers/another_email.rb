class AnotherEmail < ActionMailer::Base
  default from: "from@example.com"

  def default_email recipients
    mail(to: recipients, subject: "Goodbye!")
  end

end
