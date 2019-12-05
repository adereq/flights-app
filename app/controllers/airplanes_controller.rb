class AirplanesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]
  layout 'admin'
 
  def index
  	@airplanes = Airplane.all
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
        format.html { redirect_to @airplane, notice: 'Airplane was successfully created.' }
        format.json { render :show, status: :ok, location: @airplane }        
      else
        format.html { render :new }
        format.json { render json: @airplane.errors, status: :unprocessable_entity }        
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @airplane.update(airplane_params)
        format.html { redirect_to @airplane, notice: 'Airplane was successfully updated.' }
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
      format.html { redirect_to airplane_path, notice: 'Airplane was successfully destroyed.' }
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