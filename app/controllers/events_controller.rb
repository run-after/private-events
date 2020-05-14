class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find(session[:id])
    @event = @user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @prev_events = Event.past(Date.today)
    @upcoming_events = Event.upcoming(Date.today)
    
  end

  def attend
    Event.find(params[:id]).attendees << User.find(params[:user])
    invitation = Invitation.find_by(invitee_id: params[:user], invited_event_id: params[:id])
    invitation.destroy
    redirect_to event_path(params[:id])
  end

  def invite
    @invited = User.find_by(name: params[:name])
  end

  private
    def event_params
      params.require(:event).permit(:date, :location)
    end
end
