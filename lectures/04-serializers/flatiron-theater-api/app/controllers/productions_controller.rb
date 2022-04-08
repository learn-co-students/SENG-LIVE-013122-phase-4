class ProductionsController < ApplicationController
    
    # '/productions'
    def index 
        render json: Production.all
    end

    # '/productions/1'
    def show
        production = Production.find(params[:id])
        render json: production
    end 
    
    # '/productions/1'
    def destroy
        production = Production.find(params[:id])
        production.destroy

        # render nothing
        # render json: {}
        head :no_content
    end 

    def user_show
        byebug
        
        production = Production.find(params[:production_id])
        
        user = User.find(params[:user_id])

        if production.users.include?(user)
            render json: user
        else
            render json: {}

            # redirect => user not found
        end
    end
end
