class Notification < ApplicationRecord
	after_commit :config_email

  def config_email
    SendConfigOkJob.perform_later({id: self.id})

    #ConfigMailer.config_email(self).deliver
  end
end
