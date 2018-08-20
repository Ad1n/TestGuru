class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      cookies[:logged_in?] = redirect_to tests_path
    else
      flash.now[:alert] = 'Who are u stranger ?'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, success: 'Successfully logged out'
  end

end
