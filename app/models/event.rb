class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  validates :name, presence: true, length: { maximum: 150 }
  validates :time, presence: true
end
