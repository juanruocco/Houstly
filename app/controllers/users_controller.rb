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
        #redirect_to tours_path
        #redirect_to people_path, notice: "#{first_name} #{last_name} has been updated!" and return
      end
    elsif  params[:commit] == 'Delete'
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = "user was deleted!"
      #redirect_to people_path, notice: "#{first_name} #{last_name} has been deleted!" and return
      #redirect_to tours_path
    end
    redirect_to users_path
  end

  private
  def users_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :birthdate, :sex, :type_license, :expiration_date)
  end
end
