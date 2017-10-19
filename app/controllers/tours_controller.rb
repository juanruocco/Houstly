class ToursController < ApplicationController
  def index
    @tour = Tour.new
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    current_place.tours << @tour
    redirect_to tours_path
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])

    if @tour.update_attributes(tour_params)
      flash[:success] = "tour updated!"
      #redirect_to tours_path
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
    end

    redirect_to tours_path
  end

  def destroy
      @tour = Tour.find(params[:id])
      @tour.destroy
      flash[:success] = "tour was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to tours_path
    end

  private
  def tour_params
    params.require(:tour).permit(:name, :description, :picture)
  end
end
