class ApplicationController < ActionController::API
    # Break Out Activity #1 => Enable Cookies / Add 'before_action' For authorize_user
    include ActionController::Cookies
    before_action :authorize_user

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    # Break Out Activity #1 => Add Method (current_user) To Confirm Current User via Session

    def current_user
        User.find_by(id: session[:current_user])
    end

    # Break Out Activity #1 => Add Method (authorize_user)

    def authorize_user
        # - Return JSON error message of "Not Authorized" unless current_user is 'true' (authorized).  
        return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
    end

    # Break Out Activity #1 => Add Method (is_admin)

    # unless session.include? :current_user
    #     render json: { error: ['Not Authorized'] }, status: :unauthorized
    # end

    def is_admin
        # - Return JSON error message of "Not Authorized" unless current_user.admin is 'true'
        return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user.admin
    end

    private

    def render_not_found(e)
        render json: {error: "#{e.model}NOT FOUND :("}, status: :not_found
    end 
end