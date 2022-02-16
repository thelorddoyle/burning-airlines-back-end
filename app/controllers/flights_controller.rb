class FlightsController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false

    def index
        headers['Access-Control-Allow-Origin'] = '*' # FIX CORS ERROR !!!
        render json: Flight.all

    end # index


    def show
        headers['Access-Control-Allow-Origin'] = '*'
        @flight = Flight.find params[:id]
        @reservation = Reservation.all.where(flight_id: (params[:id]))
        @plane = Airplane.find_by params[:airplane_id]
        response = {flight: @flight, reservation: @reservation, plane: @plane}
        render json: response

    end

    # def create
    #     secret = Flight.create content: params[:content]
    # 
    #     if flight.persisted?
    #        render json:flight
    #     else
    #        render json: {error: 'could not create flight'}, status: 422
    #     end
    # 
    # end # create

end