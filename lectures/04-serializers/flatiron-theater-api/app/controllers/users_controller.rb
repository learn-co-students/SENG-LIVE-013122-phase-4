class UsersController < ApplicationController
    
    # '/users'
    def index
        render json: User.all
    end 

    # '/users/1'
    def show
        #Show current user
    end 

    # '/users'
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

    private 

    def user_params
        params.permit(:name, :email)
    end 
end
