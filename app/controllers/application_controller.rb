class ApplicationController < ActionController::Base
  before_action :set_locale

  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to login_path, alert: I18n.t('auth.must_be_logged_in') unless user_signed_in?
  end

  def switch_locale
    locale = params[:locale] || I18n.default_locale
    session[:locale] = locale
    redirect_back(fallback_location: root_path)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || extract_locale_from_header || I18n.default_locale
    session[:locale] = I18n.locale 
  end

  def extract_locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
end
