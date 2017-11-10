class ImagedescriptionsController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @imagedescription = Imagedescription.new
    #@room = @place.rooms.build
  end

  def update
    @imagedescription = Imagedescription.find(params[:id])
    if @imagedescription.update_attributes(imagedescription_params)
      flash[:success] = "place updated!"
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

  def destroy
      @imagedescription = Imagedescription.find(params[:id])
      @imagedescription.destroy
      flash[:success] = "Image Description was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to place_webcomponents_path
  end


  private

  def imagedescription_params
    params.require(:imagedescription).permit(:name, :description, :image_path)
  end
end
