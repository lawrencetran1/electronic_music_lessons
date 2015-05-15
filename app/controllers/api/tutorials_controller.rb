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
      
      @tutorial = Tutorial.create(tutorial_params)
      @test = params[:lessons_attributes]
      params[:lessons_attributes].each do |lesson|
        @tutorial.lessons.create(name: lesson["name"], category: lesson["category"], body: lesson["body"])
      end
      
    end 

   private

    def tutorial_params
      params.require(:tutorial).permit(:name, :description, :category, :picture, :lessons_attributes => [:name, :category, :body])
    end   

  end

end 