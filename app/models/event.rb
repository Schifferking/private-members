class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: 'creator_id'
  has_many :user_events, foreign_key: :attended_event_id
  has_many :attendees, through: :user_events, source: :attendee
end
