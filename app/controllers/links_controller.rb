class LinksController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @link = Link.new
    #@room = @place.rooms.build
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "place updated!"
    end
    redirect_to place_webcomponent_links_path
  end

  def create
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @link = Link.new(link_params)


    @webcomponent.links << @link
    redirect_to place_webcomponent_links_path
    return
  end

  def destroy
      @link = Imagedescription.find(params[:id])
      @link.destroy
      flash[:success] = "link was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to place_webcomponents_path
  end


  private

  def link_params
    params.require(:link).permit(:name, :description, :url)
  end
end
