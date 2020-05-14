class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :attendences, foreign_key: 'attendee_id', inverse_of: 'attendee'
  has_many :attended_events, :through => :attendences

  def prev_events
    self.attended_events.select { |event| event if event.date < Date.today }
  end

  def upcoming_events
    self.attended_events.select { |event| event if event.date >= Date.today }
  end 

end