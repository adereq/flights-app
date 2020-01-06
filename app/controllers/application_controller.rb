class ApplicationController < ActionController::Base
  include ErrorResponseActions

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:client_role, :first_name, :last_name])
  end
end
