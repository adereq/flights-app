class AirplanesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]
  before_action :airplane_authorization
  layout 'admin'

  def airplane_authorization
    if current_user.superadmin_role || current_user.airline_manager_role
    else
      authorization_error
    end
  end

  def index
    @q = Airplane.ransack(params[:q])
    @airplanes = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def new
  	@airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    respond_to do |format|
      if @airplane.save
        format.html { redirect_to @airplane, notice: 'Samolot dodane poprawnie.' }\
      else
        format.html { redirect_to new_airport_path, notice: "Błąd podczas dodawania samolotu" }       
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @airplane.update(airplane_params)
        format.html { redirect_to @airplane, notice: 'Samolot zmodywikowany poprawnie.' }
        format.json { render :show, status: :ok, location: @airpane }
      else
        format.html { render :edit }
        format.json { render json: @airplane.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy
    @airplane.destroy
    respond_to do |format|
      format.html { redirect_to airplanes_path, notice: 'Lotnisko usunięte.' }
      format.json { head :no_content }
    end
  end

  private
  	def set_airplane
  	  @airplane = Airplane.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
    end

  	def airplane_params
      params.require(:airplane).permit(:model, :economy_seats, :business_seats)

    end  	

end