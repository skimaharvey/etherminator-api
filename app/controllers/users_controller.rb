class UsersController < ApplicationController
    skip_before_action :authenticate

    def level_start 
        @user = User.find_by(address: params["userAddress"])
        current_levels_started = @user.levels_started || []
        unless current_levels_started.include?(params['setUpAddress'])
            current_levels_started.push(params['setUpAddress'])
            @user.update(levels_started: current_levels_started)
        end
        render json: {message: "Level registered to user profile"}
    end
end
