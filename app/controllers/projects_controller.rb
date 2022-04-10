class ProjectsController < ApplicationController
    skip_before_action :authenticate_user

    def index
        render json: Project.all
    end
end
