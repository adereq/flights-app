class AirportsController < ApplicationController
  before_action :set_airport, only: [:show, :edit, :update, :destroy]

  def index
  	@airports = Airport.all
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
        format.html { redirect_to @airport, notice: 'Blog was successfully created.' }
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
        format.html { redirect_to @airport, notice: 'Blog was successfully updated.' }
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
      format.html { redirect_to blogs_url, notice: 'Airpot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  	def set_airport
  	  @airport = Airport.find(params[:id])
  	end

  	def airport_params
      params.require(:airport).permit(:city, :country, :name, :iata, :latitude, :longitude, :timezone, :image)
    end  	

end