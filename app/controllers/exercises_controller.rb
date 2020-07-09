class ExercisesController < ApplicationController
    def index
        @exercises = Exercise.order(:name).all
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
    
    def new  
        @exercise = Exercise.new
    end

    def create
        @user = current_user
        @exercise = Exercise.new(exercise_params)
        if @exercise.save
            redirect_to exercise_path(@exercise)
        else
            render :new 
        end
    end
    
    def show
        @exercise = Exercise.find(params[:id])
        @user = User.find(@exercise.user_id)
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
            render :show
        else
            render :edit
        end  
    end 

    # def destroy
    #     @exercise = Exercise.find(params[:id])
    #     if @exercise.reviews_count == 0
    #         @exercise.destroy
    #         redirect_to user_path(current_user)
    #     else
    #       flash[:alert] = "You cannot delete an exercise with comments"
    #       redirect_to user_path(current_user)
    #     end    
    # end

private

    def exercise_params
        params.require(:exercise).permit(:name, :body_part, :exercise_group, :equipment, :description, :user_id)
    end

end
