class WorkoutsController < ApplicationController
  
    def index
        @workouts = Workout.order(:name).all
    end

    def new
        @workout = Workout.new
        @exercises =Exercise.order(:name).all
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
        if current_user.id == @workout.user_id
            @exercises =Exercise.order(:name).all
        else
            flash[:alert] = "You cannot edit another user's workout."
            redirect_to user_path(current_user)
        end
    end
    
    def update
        @exercises =Exercise.order(:name).all
        @workout = Workout.find(params[:id])
        if @workout.update(workout_params)
            render :show
        else
            render :edit
        end  
    end
    
    def destroy
        @workout = Workout.find(params[:id])
        if current_user.id == @workout.user_id
            @workout.destroy
            redirect_to user_path(current_user)
        else
            flash[:alert] = "You cannot delete another user's workout."
            redirect_to user_path(current_user)        
        end     
    end
    

private

    def workout_params
        params.require(:workout).permit(:name, :user_id, :first_exercise, :second_exercise, :third_exercise, :fourth_exercise, :fifth_exercise)
    end 

    

end 