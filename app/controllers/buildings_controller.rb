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

  def update
    @building = Building.find(building_params)

    if @building.update(building_params)
      redirect_to buildings_path,
        notice: 'Building updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    Building.find(params[:id]).destroy
    redirect_to buildings_path,
      notice: "Building was successfully deleted!"
  end

  private
  def buildings
    @buildings ||= Building.all
  end
  def building_params
    params.require(:building).permit(:street_address, :city, :state_id, :postal_code, :description, :owner_id)
  end
end
