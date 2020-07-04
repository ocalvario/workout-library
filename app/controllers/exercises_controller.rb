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

    def edit
        @exercise = Exercise.find(params[:id])
    end
    
    def update
        @exercise = Exercise.find(params[:id])
        if @exercise.update(exercise_params)
            render :show
        else
            render :edit
        end  
    end 

private

    def exercise_params
        params.require(:exercise).permit(:name, :body_part, :exercise_group, :equipment, :description, :user_id)
    end

end
