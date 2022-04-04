class ProductionRolesController < ApplicationController
    def index
        render json: ProductionRole.all
    end 

    def show
        production_roles = ProductionRole.find(params[:id])
        render json: production_roles, include: :production
    end 
end
