class StaticPagesController < ApplicationController

    def index

    @tutorials = Tutorial.all
    # when tutorial.category == "Audio Production"
    #   puts "audio image"
    # when tutorial.category == "keyboards"
    #   puts "keyboard image"
    # else
    #   puts "default tutorial image"
    # end
    end


    def about
    end

    def faq
    end

    def contact
    end

end
