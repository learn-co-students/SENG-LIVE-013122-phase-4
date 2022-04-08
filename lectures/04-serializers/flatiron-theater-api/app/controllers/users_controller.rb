class UsersController < ApplicationController
    
    # '/users'
    def index
        users = User.all

        # Access Deeply Nested Information for User's Production's Users
        # Use Case => See Other Attendees for Productions
        render json: users, include: ['productions', 'productions.users']
    end 

    # '/users/1'
    def show
        user = User.find(params[:id])
        
        # Access Deeply Nested Information for User's Production's Users
        # Use Case => See Other Attendees for Productions
        render json: user, include: ['productions', 'productions.users']
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
