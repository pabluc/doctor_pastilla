class ConfigMailer < ApplicationMailer
  default from: 'lolomanolox2@gmail.com'

  def config_email(notification)
    @notification = notification

    mail(to: @notification.email, subject: "Notificación programada")
  end
end
