class SecretsController < ApplicationController

    skip_before_action :verify_authenticity_token, raise: false

    def index
        headers['Access-Control-Allow-Origin'] = '*' # FIX CORS ERROR !!!
        render json: Flight.all

    end # index

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