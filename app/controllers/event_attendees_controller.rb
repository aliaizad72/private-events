class EventAttendeesController < ApplicationController
  before_action :authenticate_user!, only: :attend
  def attend
    @event = Event.find_by(id: params[:id])
    @event.attendees << current_user
    redirect_to event_path(params[:id])
  end
end
