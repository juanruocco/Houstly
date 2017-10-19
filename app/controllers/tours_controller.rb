class ToursController < ApplicationController
  def index
  end

  def new
  end

  def create
    tour = Tour.new(tour_params)
    current_place.tours << tour
    redirect_to '/tours'

  end

  private
  def tour_params
    params.require(:tour).permit(:name, :description, :picture)
  end
end
