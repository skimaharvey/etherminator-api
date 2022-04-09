class TagsController < ApplicationController
    skip_before_action :authenticate_user
    skip_before_action :authenticate

    def index
        render json: {Tag.all}
    end

end
