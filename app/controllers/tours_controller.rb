class ToursController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @tour = Tour.new
  end

  def create
    @place = Place.find(params[:place_id])
    @tour = Tour.new(tour_params)
    @place.tours << @tour
    render 'index'
  end

  def update
    @place = Place.find(params[:place_id])
    @tour = Tour.find(params[:id])
    if params[:commit] == 'Update'
      if @tour.update_attributes(tour_params)
        flash[:success] = "tour updated!"
        #redirect_to tours_path
        #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
      end
    elsif  params[:commit] == 'Delete'
      @tour = Tour.find(params[:id])
      @tour.destroy
      flash[:success] = "tour was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      #redirect_to tours_path
    end
    redirect_to place_tours_path
  end


  private
  def tour_params
    params.require(:tour).permit(:name_id, :title, :description, :image_path)
  end
end
