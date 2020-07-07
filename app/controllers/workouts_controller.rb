class WorkoutsController < ApplicationController
  
    def new
        @workout = Workout.new
    end

    def create
        @exercises = Exercise.all
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end 
    end

    def show
        @workout = Workout.find(params[:id])
        render :show 
    end 

private

    def workout_params
        params.require(:workout).permit(:name, :user_id, :first_exercise, :second_exercise, :third_exercise, :fourth_exercise, :fifth_exercise)
    end 

    

end 