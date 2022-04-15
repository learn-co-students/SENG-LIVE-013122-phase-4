class UsersController < ApplicationController
    # Break Out Activity #2 => Set 'authorize_user' to Skip Create Action

    def index
        render json: User.all
    end 

    def show
        # byebug

        current_user = User.find_by(id: session[:current_user])
        render json: current_user
    end 

    def create
        user = User.create!(user_params)
        session[:current_user] = user.id

        render json: user, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

    private 

    def user_params
        params.permit(:name, :email, :password)
    end 

end
