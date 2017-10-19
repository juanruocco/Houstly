class PlacesController < ApplicationController
  def index
  end

  def new
  end

  def create
    place = Place.new(place_params)
    place.save
    redirect_to '/place'
  end

  private
  def place_params
    params.require(:place).permit(:name, :description, :picture, :video_url)
  end

end
