class Notification < ApplicationRecord
  after_create :create_job_confirmation
  after_create :create_job_reminder

  def create_job_confirmation
    SendConfigOkJob.perform_later({id: self.id})
  end

  def create_job_reminder
    if self.start.past?
      SendNotificationJob.perform_later({id: self.id})
    else
      SendNotificationJob.set(wait_until: self.start).perform_later({id: self.id})
    end
  end
end
