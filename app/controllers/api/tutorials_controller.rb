module Api
    class TutorialsController < ApplicationController
    protect_from_forgery with: :null_session

    def index 
      tutorials = Tutorial.all
      render json: tutorials, only: [:name, :id, :description]

    end

    def show
      tutorial = Tutorial.find(params[:id])
      render json: tutorial, except: [:created_at, :updated_at], 
      include: {lessons:{only: :name, :description}}
    end
  end
end 