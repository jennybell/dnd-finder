class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email address latitude longitude rating dm terms alignment username bio avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email location dm alignment username bio avatar])
  end
end
