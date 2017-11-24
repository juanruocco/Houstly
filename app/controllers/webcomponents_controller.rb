class WebcomponentsController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.new
    #@room = @place.rooms.build
  end

  def edit
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:id])
    #@room = @place.rooms.build
  end

  def update
    @webcomponent = Webcomponent.find(params[:id])
    if @webcomponent.update_attributes(webcomponent_params)
      flash[:success] = "place updated!"
    end
    redirect_to edit_place_webcomponent_path
  end

  def create
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.new(webcomponent_params)
    
    @place.webcomponents << @webcomponent
    render 'index'
    return
  end

  def destroy
      @webcomponent = Webcomponent.find(params[:id])
      @webcomponent.destroy
      flash[:success] = "Web component was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      redirect_to place_webcomponents_path
  end


  private

  def webcomponent_params
    params.require(:webcomponent).permit(:name, :description, :style)
  end
end
