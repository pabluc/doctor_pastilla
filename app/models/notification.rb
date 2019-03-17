class Notification < ApplicationRecord
  after_create :create_job_confirmation  #Callbacks que se ejecutan al llenar el formulario de notificar.
  after_create :create_job_reminder

  # Se crea una tarea en background para enviar un email de confirmación.
  # El email de confirmación avisa que los recordatorios fueron programados correctamente.
  def create_job_confirmation
    SendConfigOkJob.perform_later({id: self.id})
  end

  # Se crea una tarea en background que enviara los recordatorios
  # Nota: Funciona de manera recursiva, una tarea se reprograma asi misma en el momento que se
  # ejecuta.
  def create_job_reminder
    if self.start.past?
      SendNotificationJob.perform_later({id: self.id})
    else
      SendNotificationJob.set(wait_until: self.start).perform_later({id: self.id})
    end
  end
end
