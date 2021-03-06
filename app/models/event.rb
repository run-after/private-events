class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :attendences, foreign_key: 'attended_event_id', inverse_of: 'attended_event'
  has_many :attendees, :through => :attendences

  has_many :invitations, foreign_key: 'invited_event_id', inverse_of: 'invited_event'
  has_many :invitees, :through => :invitations

  scope :past, ->(date_today){ where("date < ?", date_today)}
  
  scope :upcoming, ->(date_today){ where("date >= ?", date_today)}

end
