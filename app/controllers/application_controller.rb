require 'jwt'

class ApplicationController < ActionController::API
    before_action :authenticate_user 


    def secret
        secret = ENV['SECRET_KEY'] || Rails.application.secrets.secret_key_base
    end

    def token
        @auth_header.split(" ")[1]
    end

    def authenticate_user
        if request.headers["Authorization"]
            begin
                @auth_header = request.headers["Authorization"]
                decoded_token = JWT.decode(token, secret)
                payload = decoded_token.first 
                user_id = payload["user_id"]
                @user = User.find(user_id)
            rescue => exception
                render json: {message: "Error: #{exception}"}, status: :forbidden
            end
        else
            render json: {message: "not authorization sent"}, status: :forbidden
        end      
    end

    #authenticate admin to create challenges etc 
    def authenticate
        if request.headers["Authorization"]
            begin
                @auth_header = request.headers["Authorization"]
                decoded_token = JWT.decode(token, secret)
                payload = decoded_token.first 
                admin_id = payload["admin_id"]
                @admin = Admin.find(admin_id)
            rescue => exception
                render json: {message: "Error: #{exception}"}, status: :forbidden
            end
        else
            render json: {message: "not authorization sent"}, status: :forbidden
        end
    end

    def create_token(payload) 
        JWT.encode(payload, secret)
    end
    

end
