class RoomsController < ApplicationController
  def index
  end

  def new
  end

  def create
    room = Room.new(room_params)
    current_place.rooms << room
    redirect_to '/rooms'

  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update_attributes(place_params)
      flash[:success] = "Place added!"
      redirect_to rooms_path and return
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
    end

    render 'edit'
  end

  private
  def room_params
    params.require(:room).permit(:name, :description, :picture)
  end
end
