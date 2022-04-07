class ProductionRolesController < ApplicationController
    
    # '/production_roles'
    def index
        production_roles = ProductionRole.all
        render json: production_roles, status: :ok
    end 

    # '/production_roles/1'
    def show
        production_role = ProductionRole.find(params[:id])
        render json: production_roles, status: :okay
    end
end
