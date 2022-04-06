class TicketsController < ApplicationController
    # Break Out Activity #1 - Add Index Action
    # Break Out Activity #1 - Add Show Action # Make Sure to Add Error Handling!
    # Break Out Activity #1 - Add Create Action # Make Sure to Add Error Handling!
    # Break Out Activity #1 - Add Strong Params

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Ticket.all, status: :ok
    end

    def show
        ticket = find_ticket
        render json: ticket, status: :ok
    end

    def create
        ticket = Ticket.create(ticket_params)
        render json: ticket, status: :created
    end

    private

    def find_ticket
        Ticket.find(params[:id])
    end

    def ticket_params
        params.permit(:price, :user_id, :production_id)
    end

    def render_not_found_response
        render json: { error: "Ticket not found" }#, status: :not_found
    end

end

