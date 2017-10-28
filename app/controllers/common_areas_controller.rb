class CommonAreasController < ApplicationController
  def index
    @common_area = CommonArea.new
  end

  def create
    @common_area = CommonArea.new(common_area_params)

    current_place.common_areas << @common_area
    redirect_to '/common_areas'
    return
  end

  def update
    @common_area = CommonArea.find(params[:id])

    if params[:commit] == 'Update'
        if @common_area.update_attributes(common_areas_params)
          flash[:success] = "common_areas updated!"
          #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
        end
    elsif params[:commit] == 'Delete'
      @common_area = CommonArea.find(params[:id])
      @common_area.destroy
      flash[:success] = "common_areas was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return

    end
    redirect_to common_areas_path
  end

  private

  def common_area_params
    params.require(:common_area).permit(:title, :description, :image_path)
  end
end
