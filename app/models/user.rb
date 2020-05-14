class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :invitations, foreign_key: 'attendee_id', inverse_of: 'attendee'#foreign_key: 'attended_event_id'
  has_many :attended_events, :through => :invitations

  def prev_events
    self.attended_events.select { |event| event if event.date < Date.today }
  end

  def upcoming_events
    self.attended_events.select { |event| event if event.date >= Date.today }
  end 

end