class StaticController < ApplicationController

    def home
        @user = current_user
        if logged_in?
            redirect_to user_path(@user)
        else    
            render :home
        end
    end

end 