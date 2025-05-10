class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :bookings, foreign_key: :attended_event
  has_many :attendees, through: :bookings

  def self.past
    Event.where("date < ?", Date.today)
  end

  def self.upcoming
    Event.where("date > ?", Date.today).or(Event.where(date: nil))
  end
end
