class ReviewsController < ApplicationController
    
before_action :get_exercise
before_action :set_review, only: [:show, :edit, :update, :destroy]

    def new  
        if logged_in?
            @review = @exercise.reviews.build
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end

    def create
        @review = @exercise.reviews.build(review_params)
        if @review.save
            redirect_to exercise_path(@exercise)
        else
            render :new
        end   
    end

    def show
        if logged_in?
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end     
    end 

    def edit
        if logged_in?
            if user_check
            else
                flash[:alert] = "You cannot edit another user's review."
                redirect_to user_path(current_user) 
            end
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end  
    end
    
    def update

        if @review.update(review_params)
            redirect_to exercise_path(@exercise)
        else
            render :edit
        end  
    end

    def destroy
        if user_check
            @review.destroy
            redirect_to exercise_path(@exercise)
        else
            flash[:alert] = "You cannot delete another user's review."
            redirect_to user_path(current_user)
        end
    end
    

    private

    def get_exercise
        @exercise = Exercise.find(params[:exercise_id])
    end

    def set_review
        @review = @exercise.reviews.find(params[:id])
    end
    
    def user_check
        current_user.id == Review.find(params[:id]).user_id
    end

    def review_params
        params.require(:review).permit(:content, :exercise_id, :user_id)
    end

    

end
