class ActivitiesController < ApplicationController
  def index
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    current_place.activities << @activity
    redirect_to '/activities'
    return
  end

  def update
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
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :image_path)
  end
end
