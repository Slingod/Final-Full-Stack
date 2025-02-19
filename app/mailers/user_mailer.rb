class UserMailer < ApplicationMailer
    default from: 'no-reply@example.com'
  
    def reset_password_instructions(user, token)
      @user = user
      @token = token
      mail(to: user.email, subject: 'Réinitialisation de votre mot de passe')
    end
  end
  