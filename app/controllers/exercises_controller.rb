class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.all
    end
    
    def new  
        @exercise = Exercise.new
    end

    def create
        @user = current_user
        #id = @user.id
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
        render :show
    end
    
private

    def exercise_params
        params.require(:exercise).permit(:name, :body_part, :exercise_group, :equipment, :description, :user_id)
    end
    
    def edit
        @exercise = Exercise.find(params[:id])
    end

end
