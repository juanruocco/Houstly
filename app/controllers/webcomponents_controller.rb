class WebcomponentsController < ApplicationController
  def index
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.new
    #@webcomponents = @place.webcomponents.all
  end



  def edit
    debugger
    @user = User.find(params[:user_id])
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:id])
  end

  def update
    debugger
    @webcomponent = Webcomponent.find(params[:id])
    if @webcomponent.update_attributes(webcomponent_params)
      flash[:success] = "place updated!"
    end
    redirect_to edit_user_place_webcomponent_path
  end

  def create
    debugger
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.new(webcomponent_params)
    #current_user.places.webcomponents << @webcomponent

    @place.webcomponents << @webcomponent
    redirect_to user_place_webcomponents_path
    #redirect_to place_webcomponents_path
  end

  def destroy
      @webcomponent = Webcomponent.find(params[:id])
      @webcomponent.destroy
      flash[:success] = "Web component was deleted!"

      redirect_to user_place_webcomponents_path
  end


  private
  def webcomponent_params
    params.require(:webcomponent).permit(:name, :description, :style)
  end
end
