module Api
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  
  class TutorialsController < ApplicationController
  protect_from_forgery with: :null_session

    def index 
      tutorials = Tutorial.all
      tutorials.each do |t|
        t.picture = view_context.image_path t.picture 
      end
      render json: tutorials, only: [:name, :description, :category, :picture], root: false

    end

    def show
      tutorial = Tutorial.find(params[:id])
      render json: tutorial, except: [:created_at, :updated_at], :include => :lessons
    end

     def create
      @tutorial = Tutorial.new(tutorial_params)

      if @tutorial.save
        render json: @tutorial, status: :created, location: @tutorial
      else
        render json: @tutorial.errors, status: :unprocessable_entity
      end
    end 

   private

    def tutorial_params
      params.require(:tutorial).permit(:name, :description, :category, :picture)
    end   

  end

end 