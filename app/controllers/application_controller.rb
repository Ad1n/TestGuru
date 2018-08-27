class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale

  def after_sign_in_path_for(resource_or_scope)
    current_user.is_a?(Admin) ? admin_tests_path : super
  end

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end