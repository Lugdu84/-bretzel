class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!,
  # a discuter with team, obliger le login AVANT mm de cliquer sur résa ou plus tard
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    # no need for app/views/bookings/create.html.erb
    redirect_to booking_path(@booking)
  end

  def index
    @bookings = Booking.all
  end

  private

  def reservation_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end
end
