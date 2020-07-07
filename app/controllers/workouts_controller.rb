class WorkoutsController < ApplicationController
  
    def index
        @workouts = Workout.all
    end

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
    
    def edit
        @workout = Workout.find(params[:id])
    end
    
    def update
        @workout = Workout.find(params[:id])
        @exercises = Exercise.all
        if @workout.update(workout_params)
            render :show
        else
            render :edit
        end  
    end
    
    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
        redirect_to user_path(current_user)    
    end
    

private

    def workout_params
        params.require(:workout).permit(:name, :user_id, :first_exercise, :second_exercise, :third_exercise, :fourth_exercise, :fifth_exercise)
    end 

    

end 