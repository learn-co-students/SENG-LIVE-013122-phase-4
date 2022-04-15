class ApplicationController < ActionController::API
    # Break Out Activity #1 => Enable Cookies / Add 'before_action' For authorize_user
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    # Break Out Activity #1 => Add Method (current_user) To Confirm Current User via Session

    # Break Out Activity #1 => Add Method (authorize_user)

        # - Return JSON error message of "Not Authorized" unless current_user is 'true' (authorized).  

    # Break Out Activity #1 => Add Method (is_admin)

        # - Return JSON error message of "Not Authorized" unless current_user.admin is 'true'

    private

    def render_not_found(e)
        render json: {error: "#{e.model}NOT FOUND :("}, status: :not_found
    end 
end