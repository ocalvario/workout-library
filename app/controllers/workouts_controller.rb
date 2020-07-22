class WorkoutsController < ApplicationController

    before_action :find_workout, only: [:show, :edit, :update, :destroy]

    def index
        if logged_in?
            @workouts = Workout.order(:name).all
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end   
    end

    def new
        if logged_in?
            @workout = Workout.new
            list_exercises
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end    
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
        if logged_in?    
            @user = User.find(@workout.user_id)
            @workout = Workout.find(params[:id])
            @exercises = @workout.exercises
            render :show
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end
    
    def edit
        if logged_in? 
            if user_check
                list_exercises
            else
                flash[:alert] = "You cannot edit another user's workout."
                redirect_to user_path(current_user)
            end
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end
    
    def update
        list_exercises
        if @workout.update(workout_params)
            render :show
        else
            render :edit
        end  
    end
    
    def destroy
        if user_check
            @workout.destroy
            redirect_to user_path(current_user)
        else
            flash[:alert] = "You cannot delete another user's workout."
            redirect_to user_path(current_user)        
        end     
    end
    

private

    def find_workout
        @workout = Workout.find(params[:id])
    end
    
    def list_exercises
        @exercises = Exercise.order(:name).all
    end

    def user_check
        current_user.id == @workout.user_id
    end

    def workout_params
        params.require(:workout).permit(:name, :user_id, :first_exercise, :second_exercise, :third_exercise, :fourth_exercise, :fifth_exercise, review_ids: [])
    end 

end 