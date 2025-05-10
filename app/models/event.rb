class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :bookings, foreign_key: :attended_event
  has_many :attendees, through: :bookings

  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date > ?", Date.today).or(Event.where(date: nil)) }
end
