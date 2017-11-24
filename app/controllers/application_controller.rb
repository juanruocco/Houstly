class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_place
    @current_place = Place.find_by(:name_id => "finca")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    puts "loggend in?"
    !current_user.nil?
  end

  def authorize
    puts "auth in"
    redirect_to '/login' unless current_user
  end

  private
    # Confirms a logged-in user.
    def logged_in_user
      puts "loggend in"
      unless logged_in?
        #store_location
        #flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


  helper_method :current_place
  helper_method :current_user
  helper_method :logged_in?

end
