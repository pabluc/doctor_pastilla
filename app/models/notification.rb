class Notification < ApplicationRecord
  after_create :create_job_confirmation

  def create_job_confirmation
    SendConfigOkJob.perform_later({id: self.id})
  end
end
