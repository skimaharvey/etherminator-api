class InstancesController < ApplicationController

    def find_instance 
        challenge_id = Challenge.find_by(address: params['setupAddress']).id
        instance = Instance.find_by(challenge_id: challenge_id, user_id: params["user_id"])
        if instance 
            render json: {instance: instance.address}
        else
            render json: {error: "No instance associated to level and user"}
        end
        
    end
end
