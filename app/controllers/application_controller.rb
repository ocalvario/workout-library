class ApplicationController < ActionController::Base

    def home
      redirect_to login_path
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !current_user.nil?
    end
    
    def log_in(user)
      session[:user_id] = user.id
    end 

end
