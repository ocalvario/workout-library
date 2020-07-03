class SessionsController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.find_by(email: params[:session][:email]) 
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end 
    end
    
    def destroy
        log_out
    end 

end
