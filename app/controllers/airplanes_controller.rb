class AirplanesController < ApplicationController
    
    skip_before_action :verify_authenticity_token, raise: false

    def index
        render json: Airplane.all
    end



    def create
  
      airplane = Airplane.create! name: params[:name], rows: params[:rows], columns: params[:columns]
  
      if airplane.persisted?
        render json: airplane
      else
        render json: { error: 'could not create secret!', status: 422 }
      end

    end

end