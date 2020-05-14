class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invitations, foreign_key: 'attended_event_id', inverse_of: 'attended_event'#foreign_key: 'attendee_id'
  has_many :attendees, :through => :invitations

  scope :past, ->(date_today){ where("date < ?", date_today)}
  
  scope :upcoming, ->(date_today){ where("date >= ?", date_today)}

end
