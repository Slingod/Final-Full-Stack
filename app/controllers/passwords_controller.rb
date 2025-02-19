class PasswordsController < ApplicationController
  before_action :set_user_by_token, only: %i[edit update]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.send_reset_password_instructions
      redirect_to login_path, notice: "Un email de réinitialisation a été envoyé."
    else
      flash.now[:alert] = "Email introuvable."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to login_path, notice: "Mot de passe mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user_by_token
    @user = User.find_by(reset_password_token: params[:token])
    redirect_to root_path, alert: "Lien invalide ou expiré." unless @user
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
