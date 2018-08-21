class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    cookies[:back_page] = request.referrer
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:back_page]
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
