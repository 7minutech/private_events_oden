class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:attended_event_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @event = Event.find(params[:booking][:attended_event_id].to_i)
    @booking = @user.bookings.build(attended_event: @event)
    if !already_attending? && @booking.save
      redirect_to user_path(@user)
    else
      if already_attending?
        flash.now[:alert] = "Already Attending"
      else
        flash.now[:alert] = "Error While Booking"
      end
      render :new, status: :unprocessable_entity
    end
  end

  private

  def already_attending?
    @user = current_user
    event_id = (params[:booking][:attended_event_id].to_i)
    attending_events[event_id] > 1
  end

  def attending_events
    attending_events = {}
    @user.bookings.each do |booking|
      if attending_events[booking.attended_event_id].nil?
        attending_events[booking.attended_event_id] = 1
      else
        attending_events[booking.attended_event_id] += 1
      end
    end
    attending_events
  end
end
