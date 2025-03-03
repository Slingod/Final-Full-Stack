class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create register unregister cancel]
  before_action :set_event, only: %i[show edit update destroy register unregister cancel]
  before_action :authorize_event_modification, only: %i[edit update destroy]
  before_action :authorize_organizer, only: %i[new create]

  def index
    if params[:year].present? && params[:month].present?
      year = params[:year].to_i
      month = params[:month].to_i
      @events = Event.where("strftime('%Y', start_date) = ? AND strftime('%m', start_date) = ?", year.to_s, format('%02d', month))
    else
      @events = Event.all
    end
  end

  def show
    if params[:year].present? && params[:month].present?
      @photos = @event.photos.where("strftime('%Y', created_at) = ? AND strftime('%m', created_at) = ?", params[:year], format('%02d', params[:month].to_i))
      @videos = @event.videos.where("strftime('%Y', created_at) = ? AND strftime('%m', created_at) = ?", params[:year], format('%02d', params[:month].to_i))
    else
      @photos = @event.photos
      @videos = @event.videos
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      attach_photos if params[:event][:photos].present?
      redirect_to @event, notice: "Event successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      attach_photos if params[:event][:photos].present?
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
    attendance&.destroy
    redirect_to event_path(@event), notice: 'Unregistration successful.'
  end

  def cancel
    @event.update(status: 'canceled')
    redirect_to events_path, notice: 'Event canceled.'
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
    return if @event

    flash[:alert] = "Event not found."
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location, photos: []).compact
  end

  def attach_photos
    valid_photos = params[:event][:photos].reject { |photo| photo.is_a?(String) }
    @event.photos.attach(valid_photos) if valid_photos.any?
  end

  def authenticate_user!
    return if user_signed_in?

    redirect_to login_path, alert: "You must be logged in."
  end

  def authorize_event_modification
    return if current_user&.admin? || current_user&.organizer? || @event.user == current_user

    redirect_to root_path, alert: "Access denied. You do not have permission to modify this event."
  end

  def authorize_organizer
    return if current_user&.organizer? || current_user&.admin?

    redirect_to events_path, alert: "You are not authorized to create events."
  end
end
