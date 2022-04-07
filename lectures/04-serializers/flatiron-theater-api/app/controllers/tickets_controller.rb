class TicketsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    # '/tickets'
    def index 
        tickets = Ticket.all
        render json: tickets, status: :ok 
    end 

    # '/tickets/1'
    def show
        ticket = Ticket.find(params[:id])
        render json:ticket, status: :ok
    end  

    # '/tickets'
    def create
        ticket = Ticket.create!(ticket_params)
        render json:ticket, status: :created
    end 

    # '/tickets/1'
    def update
        ticket = Ticket.find(params[:id])
        ticket.update!(ticket_params)
        render json:ticket, status: :ok
    end 

    # '/tickets/1'
    def destroy
        ticket = Ticket.find(params[:id])
        ticket.destroy
        head :no_content 
    end 
    
    private 

    def render_unprocessable_entity(invalid)
        render json:{errors: invalid.record.errors}, status: :unprocessable_entity
    end 

    def render_not_found
        render json: {error: "not found"}, status: :not_found
    end 

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end 
end
