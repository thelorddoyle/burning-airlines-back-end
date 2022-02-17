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
        @plane = Airplane.find_by id:@flight.airplane_id
        response = {flight: @flight, reservation: @reservation, plane: @plane}
        render json: response

    end



    def search
        @flight = Flight.where origin: params[:origin], destination: params[:destination]
        # @destination = Flight
        response = {origin: @flight}
        render json: response 
    end

    def create
  
        flight = Flight.create! airplane_id: params[:airplane_id], origin: params[:origin], destination: params[:destination], date: params[:date]

        if flight.persisted?
            render json: flight
        else
            render json: { error: 'could not create secret!', status: 422 }
        end

    end

end