class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    notification = Notification.where(id: args[0][:id]).last

    #Salida en consola:
    ap "Se ejecuta Recordatorio: #{notification}"

    # Se pregunta present? para saber si no fue borrado.
    # Si fue borrado no se programa un nuevo recordatorio. 
    if notification.present?
      # Se reprograma un nuevo recordatorio para dentro de los minutos correspondientes. (Recursivo) 
      SendNotificationJob.set(wait_until: notification.cadence_minutes.minutes.from_now).perform_later({id: notification.id})

      # Se envia un email con el recordatorio de tomar la medicación.
      ReminderMailer.reminder_email(notification).deliver_now
    end
  end
end
