class ProductionsController < ApplicationController
    
    # '/productions'
    def index 
        render json: Production.all
    end

    # '/productions/1'
    def show
        production = Production.find(params[:id])
        render json: production, include: :production_roles
    end 
    
    # '/productions/1'
    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content
    end 
end
