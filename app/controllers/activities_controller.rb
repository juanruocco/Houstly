class ActivitiesController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @activity = Activity.new

  end

  def create
    @place = Place.find(params[:place_id])
    @activity = Activity.new(activity_params)
    @place.activities << @activity
    redirect_to place_activities_path
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
    redirect_to place_activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :image_path)
  end
end
