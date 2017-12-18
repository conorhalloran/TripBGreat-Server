module V1
    class UsersController < ApplicationController

        def index
            users = User.all
            render json: users
        end

        def show
            users = User.all
            user = User.find(params[:id]) 
            trips = user.trips
            friends = user.friends
            render json: user
        end

        def create
            user = User.new user_params
            user.password = params[:password]
            if user.save
            if user&.authenticate(params[:password])
                render json: {
                jwt: encode_token({
                    id: user.id,
                    full_name: user.full_name,
                    email: user.email
                })
                }
            else
                head :not_found
            end
            else
            render json: { errors: user.errors.full_messages}
            end
        end
        
        private
        
        def encode_token(payload = {}, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end
        
        def user_params
            params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation
            )
        end

    end
end