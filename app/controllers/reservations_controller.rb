class ReservationsController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false

  def create

    reservation = Reservation.create! row: params[:row], column: params[:column], flight_id: params[:flight_id]

    if reservation.persisted?
      render json: reservation
    else
      render json: { error: 'could not create secret!', status: 422 }
    end
  end


end