class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:destroy]
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
      params.require(:airplane).permit(:model, :economy_seats, :business_seats)

    end 
end