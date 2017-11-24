class PlacesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @place = Place.new
    #if !current_user #master version
    #  redirect_to '/login'
    #end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    current_user.places << @place
    flash[:success] = "Place was inserted!"
    redirect_to user_places_path
  end


  def edit
    @user = User.find(params[:user_id])
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    #current_place = @place #master version
    if @place.update_attributes(place_params)
      flash[:success] = "place updated!"

    end
    #redirect_to edit_place_path(@place)  #master version
    #redirect_to user_places_path

  end

  def destroy
      @place = Place.find(params[:id])
      @place.destroy
      flash[:success] = "Place was deleted!"
      redirect_to user_places_path, notice: "Place has been deleted!" and return
  end

  private
  def place_params
    params.require(:place).permit(:name_id, :name, :description, :facebook_url, :email, :cellphone, :logo_path, :location_url, :location_name, :picture, :video_url, :reservar_url, :music_path, :max_thumb_images, :max_slider_images, :direction, :telephone)
  end

end
