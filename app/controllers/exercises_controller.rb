class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.order(:name).all
    end

    def bodyparts
        @exercises = Exercise.order(:body_part, :name).all
    end
    
    def equipment
        @exercises = Exercise.order(:equipment, :name).all
    end 
    
    def new  
        @exercise = Exercise.new
    end

    def create
        @user = current_user
        @exercise = Exercise.new(exercise_params)
        @exercise.set_user!(current_user)
        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :new 
        end
    end
    
    def show
        @exercise = Exercise.find(params[:id])
        @reviews = Review.where(exercise_id: @exercise.id)
        render :show
    end

    def edit
        @exercise = Exercise.find(params[:id])
    end
    
    def update
        @exercise = Exercise.find(params[:id])
        @reviews = Review.where(exercise_id: @exercise.id)
        if @exercise.update(exercise_params)
            @exercise.set_user!(current_user)
            render :show
        else
            render :edit
        end  
    end 

    def destroy
        @user = current_user
        @exercise = Exercise.find(params[:id])
        @exercise.destroy
        redirect_to user_path(current_user)
    end

private

    def exercise_params
        params.require(:exercise).permit(:name, :body_part, :exercise_group, :equipment, :description, :user_id)
    end

end
