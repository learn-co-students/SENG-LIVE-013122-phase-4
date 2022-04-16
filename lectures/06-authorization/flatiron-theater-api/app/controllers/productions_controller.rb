class ProductionsController < ApplicationController
    # Break Out Activity #2 => Set 'is_admin' to Fire Only Before Create + Destroy Actions

        # - We only want Admins to have the capability to create / destroy Productions

    before_action :is_admin, only: [:create, :destroy]

    def index 
        render json: Production.all
    end 

    def show
        production = Production.find(params[:id])
        render json: production
    end 

    def create
        production = Production.create!(production_params)
        # byebug
        render json: production, status: :created
    rescue  ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
     
    end 
    
    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    end 

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 
end
