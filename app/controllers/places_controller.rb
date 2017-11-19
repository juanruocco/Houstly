class PlacesController < ApplicationController

  def index
    @place = Place.new
    if !current_user
      redirect_to '/login'
    end

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
    redirect_to edit_place_path(@place)
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
    params.require(:place).permit(:name_id, :name, :description, :facebook_url, :email, :cellphone, :logo_path, :location_url, :location_name, :picture, :video_url, :music_path, :max_thumb_images, :max_slider_images)
  end

end
