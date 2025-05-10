class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :bookings, foreign_key: :attendee_id
  has_many :attended_events, through: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
end
