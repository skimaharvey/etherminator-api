class UsersController < ApplicationController
    skip_before_action  :authenticate, only: [:login]
    #new instance creation => remove level from finished levels
    def check_if_finished
        levels_finished = @user.levels_finished || []
        print levels_finished
        if levels_finished.include?(@challenge.setup_address)
            levels_finished.delete(@challenge.setup_address)
            @user.update(levels_finished: levels_finished)
            #delete instance as well 
            Instance.find_by(user_id: @user.id, challenge_id: @challenge.id).destroy
        end
    end

    #add level to levels_started user att
    def level_start 
        @setup_address = params['setUpAddress'].upcase
        @user = User.find_by(address: params["userAddress"].upcase) #had to upcase because cases where changing after saving in contract
        if @user
            @challenge = Challenge.find_by(address: @setup_address)
            current_levels_started = @user.levels_started || []
            unless current_levels_started.include?(@setup_address)
                @user.update(levels_started: current_levels_started.push(@setup_address.upcase))
            end
            #delete from finished level if new instance created
            check_if_finished
            #save instance 
            Instance.create(user_id: @user.id, challenge_id: challenge.id, address: params["instanceAddress"].upcase) #had to upcase because cases where changing after saving in contract
            render json: {message: "Level registered to user profile"}
        else
            render json: {error: "could not not find user associated to this address"}
        end
    end

    #add level to levels_started user att
    def level_end 
        setup_address = params["setUpAddress"].upcase
        @user = User.find_by(address: params["userAddress"].upcase)
        if @user 
            levels_finished = @user.levels_finished 
            !levels_finished.include?(setup_address) && levels_finished.push(setup_address)
            if @user.update(levels_finished: levels_finished)
                levels_started = @user.levels_started
                @user.update(levels_started: levels_started.delete(setup_address) || [])
                render json: {message: "Added to finished levels and removed from started levels"}
            end 
        else
            render json: {error: "could not find user"}
        end
    end

    def login 
        @user = User.find_by(address: params[:address].upcase) #had to upcase because cases where changing after saving in contract
        if @user
            render json: {user: @user}
        else
            @user = User.new(address: params[:address].upcase) #had to upcase because cases where changing after saving in contract
            if @user.save 
                render json: {user: @user}
            else
                render json: {error: "Could not save new user"}
            end
        end
    end
end
