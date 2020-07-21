class SessionsController < ApplicationController

    def new
      if logged_in?  
        flash[:alert] = "Please logout first"
        redirect_to user_path(current_user)
      else  
        @user = User.new
      end
    end 

    def create
      validate_login
    end 
    
    def omniauth
      @user = User.find_or_create_by_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end

    def destroy
      log_out
    end 

private

def auth
    request.env['omniauth.auth']
  end

def validate_login
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:notice] = "Invalid credentials, please try again."
      render :new
    end
  end
end 
