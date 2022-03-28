class InstancesController < ApplicationController
    skip_before_action :authenticate
    def find_instance 
        challenge_id = Challenge.find_by(address: params['setupAddress']).id
        instances = Instance.where(challenge_id: challenge_id, user_id: params["user_id"])
        if instances.length > 0 
            render json: {instance: instances.last.address}
        else
            render json: {error: "No instance associated to level and user"}
        end
        
    end
end
