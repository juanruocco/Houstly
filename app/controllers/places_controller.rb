class PlacesController < ApplicationController

  def index
    @place = Place.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    render 'index'
  end

  def edit
    @place = Place.find(params[:id])
    puts "place controller"
    puts @place.name
    #current_place = @place

  end

  def update
    @place = Place.find(params[:id])
    current_place = @place
    if @place.update_attributes(place_params)
      flash[:success] = "place updated!"

    end
    #redirect_to places_path
  end

  def destroy
      @place = Place.find(params[:id])
      @place.destroy
      flash[:success] = "Place was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to places_path
    end

  private
  def place_params
    params.require(:place).permit(:name_id, :name, :description, :location_name, :picture, :video_url, :max_thumb_images, :max_slider_images)
  end

end
