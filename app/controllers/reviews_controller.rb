class ReviewsController < ApplicationController
    
    def index
        @reviews = Review.order(id: :desc).all
        @latest = @reviews.first
        @commenter = User.order(reviews_count: :desc).first
        @popular = Exercise.order(reviews_count: :desc).first
    end
    
    def new  
        @exercise = Exercise.all
        @review = Review.new
    end

    def create
        @user = current_user
        @exercise = Exercise.all
        @review = Review.new(review_params)
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
        if current_user.id == Review.find(params[:id]).user_id
            @exercise = Exercise.all
        else
            flash[:alert] = "You cannot edit another user's comment."
            redirect_to user_path(current_user) 
        end 
    end
    
    def update      
        @review = Review.find(params[:id])
        @exercise = Exercise.all
        if @review.update(review_params)
            render :show
        else
            render :edit
        end  
    end

    def destroy
        if current_user.id == Review.find(params[:id]).user_id
            @user = current_user
            @review = Review.find(params[:id])
            @review.destroy
            redirect_to user_path(current_user)
        else
            flash[:alert] = "You cannot delete another user's comment."
            redirect_to user_path(current_user)
        end
    end
    
    

    private

    def review_params
        params.require(:review).permit(:content, :exercise_id, :user_id)
    end

    

end
