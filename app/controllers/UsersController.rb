class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update]
    before_action :authenticate_user!, only: %i[show edit update]
    before_action :authorize_user!, only: %i[edit update]
  
    def index
      @users = User.all  # Get all users
    end
  
    def show
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Account created successfully !"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: "Profile updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
  
    def authenticate_user!
      redirect_to login_path, alert: "You must be logged in." unless logged_in?
    end
  
    def authorize_user!
      redirect_to root_path, alert: "Unauthorized action." unless @user.id == session[:user_id]
    end
  end
  