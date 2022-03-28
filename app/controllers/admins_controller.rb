
class AdminsController < ApplicationController
    before_action :authenticate_user 
    before_action :authenticate
    skip_before_action :authenticate_user, only: [:login]
    skip_before_action :authenticate, only: [:login]

 
    def create 
        @admin = Admin.new(username: params[:username], password_digest: params[:password])

        if @admin.save 
            payload = {admin_id: @admin.id}
            token= create_token(payload)
            render json: @admin, status: :created, location: @admin
        else 
            render json: @admin.errors, status: :unprocessable_entity
        end
    end

    def login
        @admin = Admin.find_by(username: params[:username])
        if @admin 
            #create a hash bug / opened issue on github 19/3/22
            # if(@admin.authenticate(params[:password]))
            
            if @admin.password_digest == params[:password]
                payload = {admin_id: @admin.id}
                token = create_token(payload)
                render json: {username: @admin.username, token: token}
            else    
                render json: {message: "Authentication Failed"}
            end
        else 
            render json: {message: "Could not find admin"}
        end
    end
end
