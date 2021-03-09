class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = Bike.where.not(latitude: nil, longitude: nil)
    @markers = @bikes.map do |bike|
      {lat: bike.latitude, lng: bike.longitude}
    end
  end

  def show
  end
end
