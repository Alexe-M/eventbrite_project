class EventMailer < ApplicationMailer
  default from: 'marichalalexe@gmail.com' # L'adresse e-mail par défaut pour l'envoi des e-mails

  def participation_email(attendance)
    @attendance = attendance # stocke l'objet d'attendance pour référence ultérieure dans les vues d'e-mail.
    @event = attendance.event # récupère l'événement associé à cette participation.
    @creator = @event.user # récupère l'utilisateur qui a créé l'événement (l'organisateur).
    @participant = attendance.user # récupère l'utilisateur qui participe à l'événement.
    puts "Sending email to creator: #{@creator.email}"
    mail(to: @creator.email, subject: 'Nouveau participant à votre événement')
  end

end






