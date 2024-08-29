class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @events = Event.all.order(id: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      @event.attendees << current_user
      redirect_to current_user
    else
      render :new, status: 422
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :time)
  end
end
