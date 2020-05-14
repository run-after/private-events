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
    redirect_to event_path(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:date, :location)
    end
end
