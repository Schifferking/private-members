class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_required)
    @event.creator = @event.build_creator(id: current_user.id)
    if @event.save
      redirect_to action: 'index'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def params_required
    params.require(:event).permit(:name, :event_date, :location, :creator_id)
  end
end
