class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create register unregister cancel]
  before_action :set_event, only: %i[show edit update destroy register unregister cancel]
  before_action :authorize_event_modification, only: %i[edit update destroy]
  before_action :authorize_organizer, only: %i[new create]

  def index
    if params[:year].present? && params[:month].present?
      year = params[:year].to_i
      month = params[:month].to_i
  
      # Adaptation pour SQLite : utilisation de strftime pour extraire l'année et le mois
      @events = Event.where("strftime('%Y', start_date) = ? AND strftime('%m', start_date) = ?", year.to_s, format('%02d', month))
    else
      @events = Event.all
    end
  end
  

  def show
    if params[:year].present? && params[:month].present?
      @photos = @event.photos.select do |photo|
        photo.created_at.year.to_s == params[:year] && photo.created_at.month.to_s == params[:month]
      end
      @videos = @event.videos.select do |video|
        video.created_at.year.to_s == params[:year] && video.created_at.month.to_s == params[:month]
      end
    else
      @photos = @event.photos
      @videos = @event.videos
    end
  end  

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
  
    if @event.save
      if params[:event][:photos]
        existing_filenames = @event.photos.map { |photo| photo.filename.to_s }
  
        params[:event][:photos].each do |photo|
          unless existing_filenames.include?(photo.original_filename)
            @event.photos.attach(photo)
          end
        end
      end
  
      redirect_to @event, notice: "Event successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully."
  end

  def register
    unless @event.attendees.include?(current_user)
      @event.event_attendances.create(user: current_user)
      EventMailer.registration_confirmation(current_user, @event).deliver_later
    end
    redirect_to event_path(@event), notice: 'Registration successful. A confirmation email has been sent.'
  end

  def unregister
    attendance = @event.event_attendances.find_by(user: current_user)
    attendance.destroy if attendance
    redirect_to event_path(@event), notice: 'Unregistration successful.'
  end

  def cancel
    @event.update(status: 'canceled')
    redirect_to events_path, notice: 'Event canceled.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Event not found."
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location, photos: [])
  end

  def authenticate_user!
    redirect_to login_path, alert: "You must be logged in." unless user_signed_in?
  end

  def authorize_event_modification
    unless current_user&.admin? || current_user&.organizer? || @event.user == current_user
      redirect_to root_path, alert: "Access denied. You do not have permission to modify this event."
    end
  end

  def authorize_organizer
    redirect_to events_path, alert: "You are not authorized to create events." unless current_user&.organizer? || current_user&.admin?
  end
end
