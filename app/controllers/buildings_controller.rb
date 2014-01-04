class BuildingsController < ApplicationController
  helper_method :buildings

  def index
  end

  def new
    @building = Building.new
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to buildings_path,
        notice: 'Building created successfully!'
    else
      render :new
    end
  end

  private
  def buildings
    @buildings ||= Building.all
  end
  def building_params
    params.require(:building).permit(:street_address, :city, :state_id, :postal_code, :description, :owner_id)
  end
end
