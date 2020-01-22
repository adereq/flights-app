class ApplicationController < ActionController::Base
  include ErrorResponseActions

  before_action :configure_permitted_parameters, if: :devise_controller?

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:client_role, :first_name, :last_name])
  end

 end
