class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :show, :index ]
  def index
    @events = Event.all
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

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])

    if @event.update(event_params)
      redirect_to current_user
    else
      render :edit, status: 422
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy

    redirect_to current_user, status: 303
  end

  private

  def event_params
    params.require(:event).permit(:name, :time)
  end
end
