class SendConfigOkJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	notification = Notification.find(args[0][:id])

    ConfigMailer.config_email(notification).deliver
  end
end
