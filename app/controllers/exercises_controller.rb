class ExercisesController < ApplicationController
    
    before_action :find_exercise, only: [:show, :edit, :update]
    
    def index
        @exercises = Exercise.order(:name).all
    end
    
    def new  
        @exercise = Exercise.new
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
        find_reviews
    end

    def edit
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
        @exercises = Exercise.order(:body_part, :name).all
    end

    def exercisegroup
        @exercises = Exercise.order(:exercise_group, :name).all
    end    

    def equipment
        @exercises = Exercise.order(:equipment, :name).all
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
