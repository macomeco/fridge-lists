module SessionsHelper
    def current_user
        @current_user ||= User.joins(:things, :tags,:lists).find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end

end
