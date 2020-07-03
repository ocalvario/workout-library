class UsersController < ApplicationController
    
    def new
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end 

    def create
        @user = User.create(
            email: params[:email], 
            password: params[:password]
        )
        if @user.save
            log_in(@user)
            redirect_to @user
        else
            render :new
        end
    end 

    def show 
        @user = User.find(params[:id]) 
    end 

end

