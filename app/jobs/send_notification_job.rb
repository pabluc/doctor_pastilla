class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = Notification.where(id: args[0][:id]).last

    if notification.present?
      SendNotificationJob.set(wait_until: notification.cadence_minutes.minutes.from_now).perform_later({id: notification.id})

      ReminderMailer.reminder_email(notification).deliver_now
    end
  end
end
