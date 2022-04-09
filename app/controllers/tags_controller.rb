class TagsController < ApplicationController
    skip_before_action :authenticate_user

    def index
        render json: Tag.all
    end

end
