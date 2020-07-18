class ApplicationController < ActionController::Base
  
  layout "application"
  helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !current_user.nil?
    end
    
    def log_in(user)
      session[:user_id] = user.id
    end
    
    def log_out
      session[:user_id] = nil
      session[:omniauth] = nil
      redirect_to '/'
    end

end
