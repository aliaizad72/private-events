class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  validates :name, presence: true, length: { maximum: 150 }
  validates :event_time, presence: true, length: { maximum: 50 }
end
