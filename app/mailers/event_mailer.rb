class EventMailer < ApplicationMailer
    default from: 'no-reply@neweralissoise.com' # Real email address to be added here
  
    def registration_confirmation(user, event)
      @user = user
      @event = event
      mail(to: @user.email, subject: "Confirmation d'inscription à #{@event.title}")
    end
  end
  