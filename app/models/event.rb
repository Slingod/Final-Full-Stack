class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendances, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :user

  validates :title, :description, :start_date, :duration, :location, :price, presence: true
end
