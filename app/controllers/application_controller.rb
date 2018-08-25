class ApplicationController < ActionController::Base

  # before_action :authenticate_user!
  protect_from_forgery with: :exception


  # before_action :set_user

  #helper_method for access inside controllers and views
  # helper_method :current_user,
  #               :logged_in?
  #
  # private
  #
  # def authenticate_user!
  #   unless current_user
  #     redirect_to login_path, alert: 'Who are u ?'
  #   end
  # end
  #
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end
  #
  # def logged_in?
  #   current_user.present?
  # end
  #
  # def set_user
  #   @user = current_user
  # end
  #
  def after_sign_in_path_for(resource_or_scope)
    current_user.is_a?(Admin) ? admin_tests_path : super
  end

end