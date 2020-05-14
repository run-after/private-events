class InvitationsController < ApplicationController
  def new
    @event = params[:invited_event]
  end

  def create
    @invite = Invitation.create(invitee: User.find_by(name: params[:invite][:invitee]), invited_event: Event.find_by(location: params[:invite][:invited_event]))
    redirect_to events_path
  end

end
