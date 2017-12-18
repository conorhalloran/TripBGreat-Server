class ApplicationController < ActionController::API
    include ActionController::Helpers

    def authenticate_user!
        redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
    end
    helper_method :authenticate_user!
    
    def current_user
    #headers: { 'authorization': 'JWT <token>'}
    token_type, token = request.headers['AUTHORIZATION']&.split(" ") || []
        case token_type&.downcase
        when 'api_key'
            @user ||= User.find_by(api_key: token)
        when 'jwt'
        begin
            payload = JWT.decode(token, Rails.application.secrets.secret_key_base)&.first
            @user ||= User.find_by(id: payload["id"])
            rescue JWT::DecodeError => error
            nil
            end
        end
    end
    helper_method :current_user
    
    # def current_user
    #     @current_user ||= User.find_by(id: session[:user_id])
    # end
    
    
    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    private
    def authenticate_api_user
        head :unauthorized unless current_user
    end

end
