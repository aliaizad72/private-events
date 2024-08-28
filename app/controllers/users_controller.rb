class UsersController < ApplicationController

  def show
    @created_events = User.find_by(params[:id]).created_events
  end
end
