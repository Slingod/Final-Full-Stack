class EventMailer < ApplicationMailer
  default from: 'no-reply@neweralissoise.com' # Real email address to be added here

  def registration_confirmation(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "Confirmation of registration at #{@event.title}")
  end

  # Added email for contact form
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: "admin@neweralissoise.com", 
         subject: "New message from #{name}", 
         from: email) do |format|
      format.html # Ensures email is sent in HTML format
    end
  end
end
