class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !current_user.nil?
  end

  def authenticate_user!
    redirect_to login_path, alert: "Vous devez être connecté." unless user_signed_in?
  end
end
