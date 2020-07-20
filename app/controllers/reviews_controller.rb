class ReviewsController < ApplicationController
    
before_action :find_review, only: [:show, :edit, :update, :destroy]

    def index
        if logged_in?
            @reviews = Review.order(id: :desc).all
            @latest = @reviews.first
            @commenter = User.order(reviews_count: :desc).first
            @popular = Exercise.order(reviews_count: :desc).first
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end
    
    def new  
        if logged_in?
            @review = Review.new
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end   
    end

    def show
        if logged_in?
            find_exercise
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end     
    end 

    def edit
        if logged_in?
            if user_check
            else
                flash[:alert] = "You cannot edit another user's comment."
                redirect_to user_path(current_user) 
            end
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end  
    end
    
    def update      
        if @review.update(review_params)
            find_exercise
            render :show
        else
            render :edit
        end  
    end

    def destroy
        if user_check
            @review.destroy
            redirect_to user_path(current_user)
        else
            flash[:alert] = "You cannot delete another user's comment."
            redirect_to user_path(current_user)
        end
    end
    

    private

    def find_review
        @review = Review.find(params[:id])
    end

    def find_exercise
        @exercise = Exercise.find(@review.exercise_id)
    end
    
    def user_check
        current_user.id == Review.find(params[:id]).user_id
    end


    def review_params
        params.require(:review).permit(:content, :exercise_id, :user_id)
    end

    

end
