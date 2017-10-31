class UsersController < ApplicationController
  def  index
    @users = User.all
  end

  def show
		@user = User.find(params[:id])
	end

  def new
    @user = User.new
  end

  def create
		@user = User.new(users_params)

		if @user.save
      session[:user_id] = @user.id
			redirect_to  @user
		else
			render 'new'
		end
	end

  def update
    @user = User.find(params[:id])
    if params[:commit] == 'Update'
      if @user.update_attributes(users_params)
        flash[:success] = "user updated!"
      end
    elsif  params[:commit] == 'Delete'
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "user was deleted!"
    end
    redirect_to users_path
  end

  private
  def users_params
    params.require(:user).permit(:first_name,:last_name,:email,:password, :password_confirmation,:birthdate,:sex,:type_license,:expiration_date)
  end
end
