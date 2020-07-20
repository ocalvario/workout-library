class ExercisesController < ApplicationController
    
    before_action :find_exercise, only: [:show, :edit, :update]
    
    def index
        if logged_in?
            @exercises = Exercise.order(:name).all
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end
    
    def new  
        if logged_in? 
            @exercise = Exercise.new
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end     
    end

    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :new 
        end
    end
    
    def show
        if logged_in? 
            find_reviews
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end
    end

    def edit
        if logged_in? 
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end
    end
    
    def update
        if @exercise.update(exercise_params)
            find_reviews
            render :show
        else
            render :edit
        end  
    end
    
    def bodyparts
        if logged_in?
            @exercises = Exercise.order(:body_part, :name).all
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end

    def exercisegroup
        if logged_in?
            @exercises = Exercise.order(:exercise_group, :name).all
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end    

    def equipment
        if logged_in?
            @exercises = Exercise.order(:equipment, :name).all
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 

    end 

private

    def find_exercise
        @exercise = Exercise.find(params[:id])
    end

    def find_reviews
        @reviews = Review.where(exercise_id: @exercise.id)
    end

    def exercise_params
        params.require(:exercise).permit(:name, :body_part, :exercise_group, :equipment, :description, :user_id)
    end

end
