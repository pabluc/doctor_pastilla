class Notification < ApplicationRecord
  after_create :create_job_confirmation

  def config_email
    SendConfigOkJob.perform_later({id: self.id})
  end
end
