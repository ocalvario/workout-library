class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end
    
    def new  
        @exercise = Exercise.all
        @review = Review.new
    end

end
