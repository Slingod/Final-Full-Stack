class PagesController < ApplicationController
  # Action to display the contact form
  def contact
    # Code to display the contact form
  end

  # Action to handle the contact form submission
  def submit_contact
    # Retrieve form data
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Add code here to process the form data, e.g., save to the database or send an email
    EventMailer.contact_email(name, email, message).deliver_now

    # Redirect to the contact page with a success message
    redirect_to contact_path, notice: 'Message sent successfully!'
  end
end
