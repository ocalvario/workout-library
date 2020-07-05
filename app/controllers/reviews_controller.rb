class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.all
        @users = User.order(reviews_count: :desc).all
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

    def edit
        @exercise = Exercise.all
        @review = Review.find(params[:id])
    end
    
    def update      
        @review = Review.find(params[:id])
        @user = User.find(@review.user_id)
        @exercise = Exercise.find(@review.exercise_id)
        if @review.update(review_params)
            @review.set_user!(current_user)
            render :show
        else
            render :edit
        end  
    end 

    private

    def review_params
        params.require(:review).permit(:content, :exercise_id, :user_id)
    end

    

end
