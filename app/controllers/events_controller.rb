class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
  end

  def new
    @event = Event.new
  end

  def create
  end
end
