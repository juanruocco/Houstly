class ActivitiesController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @activity = Activity.new

  end

  def create
    @place = Place.find(params[:place_id])
    @activity = Activity.new(activity_params)
    @place.activities << @activity
    render 'index'
    return
  end

  def update
    @place = Place.find(params[:place_id])
    @activity = Activity.find(params[:id])

    if params[:commit] == 'Update'
        if @activity.update_attributes(activity_params)
          flash[:success] = "activity updated!"
          #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
        end
    elsif params[:commit] == 'Delete'
      @activity = Activity.find(params[:id])
      @activity.destroy
      flash[:success] = "Acitivity was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return

    end
    render 'index'
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :image_path)
  end
end
