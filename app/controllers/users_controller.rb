class UsersController < ApplicationController

    #new instance creation => remove level from finished levels
    def check_if_finished(level_address)
        levels_finished = @user.levels_finished || []
        if levels_finished.include?(level_address)
            levels_finished.delete(level_address)
            @user.update(levels_finished: levels_finished)
        end
    end

    #add level to levels_started user att
    def level_start 
        @user = User.find_by(address: params["userAddress"])
        current_levels_started = @user.levels_started || []
        unless current_levels_started.include?(params['setUpAddress'])
            check_if_finished(params['setUpAddress'])
            @user.update(levels_started: current_levels_started.push(params['setUpAddress']))
        end
        #save instance 
        challenge = Challenge.find_by(address: params['setUpAddress'])
        Instance.create(user_id: @user.id, challenge_id: challenge.id)
        render json: {message: "Level registered to user profile"}
    end

    #add level to levels_started user att
    def level_end 
        @user = User.find_by(address: params["userAddress"])
        levels_finished = @user.levels_finished || []
        if @user.update(levels_finished: levels_finished.push(params["setUpAddress"]))
            levels_started = @user.levels_started
            @user.update(levels_started: levels_started.delete('setUpAddress'))
            render json: {message: "Added to finished levels and removed from started levels"}
        end 
    end
end
