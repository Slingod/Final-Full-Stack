class StaticPagesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
    def index
      # This method displays the home page.
      # Make sure there are no redirects here that could cause a loop.
      @events = Event.all
    end
  
    def secret
      # This method is protected by authentication.
      # Make sure it doesn't redirect to itself.
    end
  
    private
  
    def request_authentication
      unless current_user
        session[:return_to_after_authenticating] = request.url
        redirect_to login_path
      end
    end
  end
  