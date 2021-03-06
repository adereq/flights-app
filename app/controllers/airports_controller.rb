class AirportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_airport, only: [:show, :edit, :update, :destroy, :get_airport]
  before_action :airport_authorization
  layout 'admin'
  
  def airport_authorization
    if current_user.superadmin_role || current_user.airline_manager_role
    else
      authorization_error
    end
  end

  def index
    @q = Airport.ransack(params[:q])
    @airports = @q.result.page(params[:page]).per(10)
  end

  def show
  end

  def new
  	@airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)
    respond_to do |format|
      if @airport.save
         format.html { redirect_to @airport, notice: 'Lotnisko dodane poprawnie.' }
      else
        format.html { redirect_to new_airplane_path, notice: "Błąd podczas dodawania lotniska" }       
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @airport.update(airport_params)
        format.html { redirect_to @airport, notice: 'Lotnisko zaktualizowane pomyślnie.' }
      else
        format.html { render :edit, notice: "Błąd podczas edytowania lotniska"  }
      end
    end
  end

  def destroy
    @airport.destroy
    respond_to do |format|
      format.html { redirect_to airports_path, notice: 'Lotnisko usunięte.' }
      format.json { head :no_content }
    end
  end

  private
  	def set_airport
  	  @airport = Airport.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
    end

  	def airport_params
      params.require(:airport).permit(:city, :country, :name, :iata, :timezone, :image)

    end  	

end
