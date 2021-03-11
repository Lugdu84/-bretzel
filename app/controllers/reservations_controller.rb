class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!,
  # a discuter with team, obliger le login AVANT mm de cliquer sur résa ou plus tard

end
