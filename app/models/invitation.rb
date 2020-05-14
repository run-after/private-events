class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'
  belongs_to :invited_event, class_name: 'Event', foreign_key: 'invited_event_id'
end
