class RoomsController < ApplicationController
  def index
    @room = Room.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    current_place.rooms << room
    redirect_to '/rooms'
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(room_params)
      flash[:success] = "room updated!"
      redirect_to rooms_path and return
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
      @room = Room.find(params[:id])
      @room.destroy
      flash[:success] = "Room was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to rooms_path
    end

  private
  def room_params
    params.require(:room).permit(:name, :description, :picture)
  end
end
