class SessionsController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        user = User.find_by(email: params[:user][:email]) 
        if user && user.authenticate(password: params[:user][:password])
            #logging in
            log_in(user)
            redirect_to user
        else
            render :new
        end 
    end 

end
