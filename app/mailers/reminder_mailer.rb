class ReminderMailer < ApplicationMailer
  default from: 'lolomanolox2@gmail.com'

  def reminder_email(notification)
    @notification = notification

    mail(to: @notification.email, subject: "Recordatorio #{Time.now}")
  end
end
