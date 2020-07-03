class ApplicationController < ActionController::Base

    def home
      redirect_to login_path
    end
    
    def log_in(user)
      session[:user_id] = user.id
    end 

end
