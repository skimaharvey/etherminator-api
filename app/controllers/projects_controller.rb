class ProjectsController < ApplicationController
    skip_before_action :authenticate_user

    def index
        render json: {projects: Project.all, skills: Skill.all}
    end
end
