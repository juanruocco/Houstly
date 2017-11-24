class LinksController < ApplicationController

  def index
    debugger
    @user = User.find(params[:user_id])
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @link = Link.new
  end

  def new
    debugger
    @link = Link.new
  end

  def create
    debugger
    @user = User.find(params[:user_id])
    @place = Place.find(params[:place_id])
    @webcomponent = Webcomponent.find(params[:webcomponent_id])
    @link = Link.new(link_params)
    @webcomponent.links << @link
    flash[:success] = "Link was inserted!"

    redirect_to user_place_webcomponent_links_path
  end

  def update
    debugger
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "link updated!"
    end
    redirect_to user_place_webcomponent_links_path
  end

  def destroy
    debugger
      @link = Link.find(params[:id])
      @link.destroy
      flash[:success] = "Link was deleted!"
      redirect_to user_place_webcomponent_links_path
  end

  private
  def link_params
    params.require(:link).permit(:name, :description, :url)
  end
end
