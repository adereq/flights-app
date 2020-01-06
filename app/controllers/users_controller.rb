class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :user_authorization
  layout 'admin'

  def index
  	@users = User.all
  end

  def user_authorization
    if current_user.superadmin_role
    else
      authorization_error
    end
  end

end