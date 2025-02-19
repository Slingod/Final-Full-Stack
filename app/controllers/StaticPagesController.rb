class StaticPagesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
    def index
      # Cette méthode affiche la page d'accueil.
      # Assurez-vous qu'il n'y a pas de redirection ici qui pourrait causer une boucle.
      @events = Event.all
    end
  
    def secret
      # Cette méthode est protégée par authentification.
      # Assurez-vous qu'elle ne redirige pas vers elle-même.
    end
  
    private
  
    def request_authentication
      unless current_user
        session[:return_to_after_authenticating] = request.url
        redirect_to login_path
      end
    end
  end
  