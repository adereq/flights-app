class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :home_authorization
  layout "admin", only: [:home]
  
  def home
  end

  def contact
  end

  def about
  end

  def regulations
  end

  def home_authorization
    if current_user.superadmin_role || current_user.airline_manager_role || current_user.airport_manager_role
    else
      authorization_error
    end
  end
end