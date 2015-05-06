module Api
    class TutorialsController < ApplicationController
    protect_from_forgery with: :null_session

    def index 
      tutorials = Tutorial.all
      render json: tutorials, only: [:name, :description,:category]

    end

    def show
      tutorial = Tutorial.find(params[:id])
      render json: tutorial, except: [:created_at, :updated_at], :include => :lessons
    end
  end
end 