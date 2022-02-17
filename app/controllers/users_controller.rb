class UsersController < ApplicationController

    def search
        render json: User.all
    end


end