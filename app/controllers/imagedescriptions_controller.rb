class ImagedescriptionsController < ApplicationController

  def index
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @imagedescription = Imagedescription.new
    #@room = @place.rooms.build
  end

  def update
    @imagedescription = Imagedescription.find(params[:id])
    if params[:commit] == 'Update'
      if @imagedescription.update_attributes(imagedescription_params)
        flash[:success] = "place updated!"
      end

    elsif params[:commit] == 'Delete'
      @imagedescription.destroy
      flash[:success] = "Image Description was deleted!"

    end
    redirect_to place_webcomponent_imagedescriptions_path
  end

  def create
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @imagedescription = Imagedescription.new(imagedescription_params)
    @webcomponent.imagedescriptions << @imagedescription
    redirect_to place_webcomponent_imagedescriptions_path
    return
  end

  private

  def imagedescription_params
    params.require(:imagedescription).permit(:name, :description, :image_path)
  end
end
