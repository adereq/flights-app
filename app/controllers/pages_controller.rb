class PagesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :home_authorization

  def home
  end

  def home_authorization
    if current_user.superadmin_role || current_user.airline_manager_role || current_user.airport_manager_role
    else
      authorization_error
    end
  end
end