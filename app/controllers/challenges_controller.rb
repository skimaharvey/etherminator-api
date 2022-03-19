class ChallengesController < ApplicationController
    skip_before_action :authenticate, only: [:index]

    def index
        render json: Challenge.all
    end

    def create 
        @challenge = Challenge.new(
            title: params['title'], code: params['code'], description: params['description'],
            difficulty: params['difficulty'], address: params['address'], author: params['author'],
            author_github: params['author_github'], author_email: params['author_email']
        )

        if @challenge.save
            render json: {message: 'new challenge saved'}
        else
            render json: {error: 'Try again later'}
        end
    end
end
