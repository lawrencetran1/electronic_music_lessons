class StaticPagesController < ApplicationController

    def index
        @tutorials = Tutorial.all
    end


    def about
    end

    def faq
    end

    def contact
    end

    def home
    end

end
