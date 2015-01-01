class EmailsController < ApplicationController
  def index
  end

  def standard
    SendEmail.default_email(recipients).deliver
    AnotherEmail.default_email(recipients).deliver

    redirect_to emails_path, notice: "Sent email (standard)."
  end

  def delayed
    SendEmailWorker.perform_async("SendEmail", recipients)
    SendEmailWorker.perform_async("AnotherEmail", recipients)

    redirect_to emails_path, notice: "Sent email (delayed)."
  end

  private

  def recipients
    [ "jose@josemota.net", "tutsplus@josemota.net" ]
  end
end
