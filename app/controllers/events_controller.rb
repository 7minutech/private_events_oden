class EventsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @events = Event.all
  end

  def new
    @user = current_user
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end

  def require_login
    redirect_to new_user_session_path if !user_signed_in?
  end
end
