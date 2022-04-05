class ProductionRolesController < ApplicationController
    def index 
        render json: ProductionRole.all
    end 

    def show
        # byebug
        production_role = ProductionRole.find(params[:id])
        render json: production_role, include: :production
    end 
end
