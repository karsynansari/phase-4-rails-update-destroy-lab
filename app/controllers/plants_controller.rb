class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = found_plant
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
 plant = found_plant
 plant.update(plant_params)
 render json: plant, status: :ok
  end

  def destroy
plant = found_plant
plant.destroy
head :no_content
  end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def found_plant
Plant.find(params[:id])
  end
end
