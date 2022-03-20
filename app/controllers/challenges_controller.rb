require 'nokogiri'

class ChallengesController < ApplicationController
    skip_before_action :authenticate, only: [:index]

    def index
        render json: Challenge.all
    end

    def html_cleaner(html)
        change_color = html.gsub("ffffff", "282C34").gsub("000000", "ffffff")
        doc = Nokogiri::HTML(change_color)
        #remove the line number on the left
        doc.search('.code_gutter', '#file_info').remove
        doc
    end

    def create 
        @challenge = Challenge.new(
            title: params['title'], code: html_cleaner(params['code']), description: params['description'],
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
