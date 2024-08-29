class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :time, presence: true

  scope :past, -> { where(time: ..Time.now) }
  scope :future, -> { where(time: Time.now..) }
end
