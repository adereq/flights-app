class AirportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    before_action :set_airport, only: [:show, :edit, :update, :destroy, :get_airport]
  layout 'admin'
  
  def index
    @q = Airport.ransack(params[:q])
    @airports = @q.result.page(params[:page]).per(10)
    #render json: JSON.pretty_generate(@airports.to_json)
  end

  def show
  end

  def get_airport
    msg = {:name => @airport.name,:country => @airport.country} 
    render :json => msg
  end

  def new
  	@airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)

    respond_to do |format|
      if @airport.save
        format.html { redirect_to @airport, notice: 'Airport was successfully created.' }
        format.json { render :show, status: :ok, location: @airport }        
      else
        format.html { render :new }
        format.json { render json: @airport.errors, status: :unprocessable_entity }        
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @airport.update(airport_params)
        format.html { redirect_to @airport, notice: 'Airport was successfully updated.' }
        format.json { render :show, status: :ok, location: @airport }
      else
        format.html { render :edit }
        format.json { render json: @airport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @airport.destroy
    respond_to do |format|
      format.html { redirect_to airports_path, notice: 'Airpot was successfully destroyed.' }
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
