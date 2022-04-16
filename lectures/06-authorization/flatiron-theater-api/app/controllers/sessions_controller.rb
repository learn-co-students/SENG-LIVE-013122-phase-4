class SessionsController < ApplicationController
    # Break Out Activity #2 => Set 'authorize_user' to Skip Login Action
    skip_before_action :authorize_user, only: [:login]

    def login
        # Find user object by username
        user = User.find_by(name:params[:username])
        
        # Authenticate user object by password
        if user&.authenticate(params[:password])

            # Break Out Activity #2 => 
            # - Set Session's 'current_user' to User's ID
            session[:current_user] = user.id

            # - Set Session's 'login_attempts' to 0
            session[:login_attempts] = 0

            # byebug
            
            render json: user, status: :ok
        else

            # Break Out Activity #2 =>
                # - Set Session's 'login_attempts' to 0 if Undefined / Falsey
                session[:login_attempts] ||= 0

                # - Increment Session's 'login_attempts' by 1
                # session[:login_attempts] = session[:login_attempts] + 1
                session[:login_attempts] += 1
            
            render json:{error:"Invalid Password and/or Username"},  status: :unauthorized
        end
    end 

    def logout
        session.delete :current_user
    end 
end
