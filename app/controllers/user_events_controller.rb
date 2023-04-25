class UserEventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @user_event = UserEvent.new
    @events = Event.all
  end

  def create
    puts required_params
    @user_event = UserEvent.new
    @user_event.attendee = @user_event.build_attendee(id: current_user.id)
    @user_event.attended_event = @user_event.build_attended_event(id: required_params[:event])
    if @user_event.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def required_params
    params.require(:user_event).permit(:event)
  end
end
