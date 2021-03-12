class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end
end
# a discuter with team, obliger le login AVANT mm de cliquer sur resa ou plus tard
