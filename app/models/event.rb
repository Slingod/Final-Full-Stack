class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendances, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :user
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy

  validates :title, :description, :start_date, :duration, :location, :price, presence: true
end
