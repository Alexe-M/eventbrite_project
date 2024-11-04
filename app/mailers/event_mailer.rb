class EventMailer < ApplicationMailer
  default from: 'marichalalexe@gmail.com'

  def participation_email(event)
    @event = event
    @organizer = event.organizer
    mail(to: @organizer.email, subject: "Someone has joined your event!"))
  end

end

