class UsersController < ApplicationController
    
    # "/users"
    def index 
        # BREAKOUT ACTIVITY 1: Adding ActiveRecord Queries
        # Pull all Users and render in JSON format

        render json: User.all
    end 

    # "/users/1"
    def show

        # BREAKOUT ACTIVITY 1: Adding ActiveRecord Queries
        # Find User by "id" params and render in JSON format along with associated tickets

        # NOTE => Use "byebug" to test your code in Terminal
        # byebug

        user = User.find(params[:id])
        render json: user, include: [:tickets, :productions]
    end 
end