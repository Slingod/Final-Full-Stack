class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id  # Stocke l'ID de l'utilisateur dans la session
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Déconnexion de l'utilisateur
    redirect_to root_path, notice: "You are logged out."
  end
end
