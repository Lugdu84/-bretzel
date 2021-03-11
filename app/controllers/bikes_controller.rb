class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
    # on a le nom d'une ville params[:query]
    # Faire une requête pour trouver les marquers proches de cette ville
      @bikes = Bike.near(params[:query], 50)
    else
      @bikes = Bike.near('Aubagne', 50)
    end
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('picto.png')
      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end
end
