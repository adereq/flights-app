class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:destroy, :show]
  before_action :user_authorization
  layout 'admin'

  def index
    @q = User.ransack(params[:q])
  	@users = @q.result.page(params[:page]).per(10)
  end

  def user_authorization
    if current_user.superadmin_role
    else
      authorization_error
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:notice] = "Użytkownik został dodany"
        format.html { redirect_to @user, notice: 'Użytkownik został dodany' }
        format.json { render :show, status: :ok, location: @user }        
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }        
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Użytkownik został usunięty.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :client_role, :superadmin_role, :airline_manager_role, :airport_manager_role, :airport_id)

    end 
end