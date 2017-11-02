
class RoomsController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @room = Room.new
    #@room = @place.rooms.build
  end

  def create
    @place = Place.find(params[:place_id])
    @room = Room.new(room_params)

    @place.rooms << @room
    render 'index'
    return
  end

  def update
    @place = Place.find(params[:place_id])

    @room = Room.find(params[:id])

    if params[:commit] == 'Update'
        if @room.update_attributes(room_params)
          flash[:success] = "room updated!"
          #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
        end
    elsif params[:commit] == 'Delete'
      @room = Room.find(params[:id])
      @room.destroy
      flash[:success] = "Room was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return

    end
    redirect_to place_rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end
