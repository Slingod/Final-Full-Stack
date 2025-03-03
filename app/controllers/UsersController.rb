class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show edit update destroy index]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.all
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
      redirect_to root_path, notice: "Account created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user, locale: I18n.locale), notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @user == current_user || current_user.admin?
      @user.destroy
      if @user == current_user
        reset_session
        redirect_to root_path, notice: "Your account has been deleted."
      else
        redirect_to users_path, notice: "User account deleted."
      end
    else
      redirect_to root_path, alert: "You are not authorized to delete this account."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :description, :profile_picture)
  end

  def authenticate_user!
    redirect_to login_path, alert: "You must be logged in." unless user_signed_in?
  end

  def authorize_user!
    unless current_user == @user || current_user.admin?
      redirect_to root_path, alert: "Unauthorized action."
    end
  end
end
