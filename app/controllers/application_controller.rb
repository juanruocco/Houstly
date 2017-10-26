class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def current_place
  #   @current_place = Place.find_by(:name_id => "finca")
  # end
  #
  # helper_method :current_place
end
