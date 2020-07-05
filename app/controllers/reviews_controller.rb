class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end
    
    def new  
        @exercise = Exercise.all
        @review = Review.new
    end

    def create
        @user = current_user
        @review = Review.new (review_params)
        @review.set_user!(current_user)
        if @review.save
           redirect_to review_path(@review)
        else
            render :new
        end   
    end

    def show
        @review = Review.find(params[:id])
        @user = User.find(@review.user_id)
        @exercise = Exercise.find(@review.exercise_id)
        render :show
    end 

    private

    def review_params
        params.require(:review).permit(:content, :exercise_id, :user_id)
    end

end
