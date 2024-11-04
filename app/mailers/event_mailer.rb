class EventMailer < ApplicationMailer
  default from: 'marichalalexe@gmail.com' # L'adresse e-mail par défaut pour l'envoi des e-mails

  def participation_email(event)
    @event = event                # Stocke l'événement pour l'utilisation dans la vue
    @organizer = event.organizer  # Récupère l'organisateur de l'événement
    mail(to: @organizer.email, subject: "Someone has joined your event!") # Envoie l'e-mail
  end
end


