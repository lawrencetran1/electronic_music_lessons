class TutorialsController < ApplicationController


        def index
            @tutorials = Tutorial.all
         
        end


        def show
            @tutorial = Tutorial.find(params[:id])
        end


        def new
            @tutorial = Tutorial.new
        end



        def create
            @tutorial = Tutorial.new(tutorials_params)
            if @tutorial.save
                redirect_to tutorials_path
            else
                render 'new'
            end
        end



        def edit
            @tutorial = Tutorial.find(params[:id])
        end


        def update
            @tutorial = Tutorial.find(params[:id])

            if @tutorial.update_attributes(params.require(:tutorial).permit(:name, :description, :category))
                redirect_to tutorials_path
            else
                render "edit"
            end
        end


        def destroy
            @tutorial = Tutorial.find(params[:id])
            @tutorial.destroy
            redirect_to tutorials_path
        end



        private
        def tutorial_params
            params.require(:tutorial).permit(:name, :description, :category)
        end



end
