class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      render :new, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_time)
  end
end
