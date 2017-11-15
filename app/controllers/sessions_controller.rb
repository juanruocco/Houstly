class SessionsController < ApplicationController
  def new
  end

  def create
    params_login = params[:session]

    if User.where(email: params_login[:email]).exists?
      user = User.find_by(email: params_login[:email])

      if user && user.authenticate(params_login[:password])
        session[:user_id] = user.id
        redirect_to '/'
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end

    else
      flash.now[:danger] = 'email doesn`t exist'
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
