class UsersController < ApplicationController

    def new
        if logged_in?  
            flash[:alert] = "Please logout first"
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to @user
        else
            render :new
        end
    end 

    def show
        if logged_in?  
            @user = User.find(params[:id])
            @exercises = Exercise.where(user_id: @user.id)
            @reviews = @user.reviews
            @workouts = @user.workouts
        else
            flash[:alert] = "Please login first"
            redirect_to login_path
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end 

end

