class SendConfigOkJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = Notification.find(args[0][:id])

    # Se envia un email avisando una confirmación de programación OK.
    ConfigMailer.config_email(notification).deliver_now
  end
end
