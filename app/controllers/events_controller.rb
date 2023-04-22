class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_required)
    @creator = @event.build_creator
  end

  def index
    @events = Event.all
  end

  private

  def params_required
    params.require(:event).permit(:name, :event_date, :location)
  end
end
