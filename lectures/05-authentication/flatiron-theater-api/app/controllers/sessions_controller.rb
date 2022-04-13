class SessionsController < ApplicationController
    def login
        user = User.find_by!(name:params[:username])
        
        # byebug

        # if user && user.authenticate
        if user&.authenticate(params[:password])
            render json: {user: "Welcome to Flatiron Theater API!"}, status: :ok 
        else 
            render json: {error: "Invalid Password or Username"}, status: :unprocessable_entity
        end 
    end 
end
