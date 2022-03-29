require 'nokogiri'

class ChallengesController < ApplicationController
    before_action :authenticate
    skip_before_action :authenticate_user
    skip_before_action :authenticate, only: [:index, :abi]
    # before_action :authenticate, only: [:create]

    def index
        render json: Challenge.all
    end

    def abi
        contract = Challenge.find_by(setup_address: params["levelAddress"].upcase)
        if contract 
            render json: {"abi": contract.contract_abi}
        else
            render json: {error: "Level address is not correct"}
        end
    end

    def html_cleaner(html)

        change_colors = html.gsub("ffffff", "282C34").gsub("000000", "F5F5F5")
        doc = Nokogiri::HTML(change_colors)
        #remove the line number on the left
        doc.search('.code_gutter', '#file_info').remove
        doc
    end

    def create 
        @challenge = Challenge.new(
            title: params['title'], code: html_cleaner(params['code']), description: params['description'],
            difficulty: params['difficulty'], address: params['address'], author: params['author'],
            author_github: params['author_github'], author_email: params['author_email'],
            contract_abi: params['contract_abi'], setup_address: params['setup_address'].upcase,
            valueL: params['value']
        )

        if @challenge.save
            #have express api listen to setup contract events (instance creation & instance completed)
            #put api on hold now because listeners where not woring to well
            # HTTParty.post("#{ENV["EXPRESS_API"]}/new_level", query: {contractAddress: @challenge.setup_address, contractAbi: @challenge.contract_abi})
            render json: {message: 'new challenge saved'}
        else
            render json: {error: 'Try again later'}
        end
    end
end
