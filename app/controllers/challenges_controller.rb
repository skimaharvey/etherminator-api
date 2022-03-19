class ChallengesController < ApplicationController
    skip_before_action :authenticate
    
    def index
        render json: Challenge.all
    end
end
