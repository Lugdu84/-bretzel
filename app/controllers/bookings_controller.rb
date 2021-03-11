class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to mybookings_path
    else
      render "bikes/show"
    end
  end

  def mybookings
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end
end
