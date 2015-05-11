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
      render json: tutorials, only: [:name, :description,:category, :picture]

    end

    def show
      tutorial = Tutorial.find(params[:id])
      render json: tutorial, except: [:created_at, :updated_at], :include => :lessons
    end
  end
end 