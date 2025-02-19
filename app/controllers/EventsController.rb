class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create register unregister cancel]
  before_action :set_event, only: %i[show edit update destroy register unregister cancel]
  before_action :authorize_admin, only: %i[edit update]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Événement créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Événement mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Événement supprimé."
  end
  

  def register
    unless @event.attendees.include?(current_user)
      @event.event_attendances.create(user: current_user)
    end
    redirect_to event_path(@event), notice: 'Inscription réussie.'
  end

  def unregister
    attendance = @event.event_attendances.find_by(user: current_user)
    attendance.destroy if attendance
    redirect_to event_path(@event), notice: 'Désinscription réussie.'
  end

  def cancel
    @event.update(status: 'canceled')
    redirect_to events_path, notice: 'Événement annulé.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Événement non trouvé."
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price)
  end

  def authenticate_user!
    redirect_to login_path, alert: "Vous devez être connecté." unless user_signed_in?
  end

  def authorize_admin
    redirect_to root_path, alert: "Accès refusé" unless current_user&.admin?
  end

  def authorize_destroy
    unless current_user&.admin? || current_user == @event.user
      redirect_to root_path, alert: "Accès refusé"
    end
  end
end
