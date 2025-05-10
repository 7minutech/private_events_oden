class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:attended_event_id])
    @booking = Booking.new
  end
end
