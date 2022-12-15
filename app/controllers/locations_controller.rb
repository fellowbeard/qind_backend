class LocationsController < ApplicationController
  def index
    locations = Locations.all
    render json: locations
  end

  def create
    location = Location.new(
      name: params[:name],
      address: params[:address]
    )
    location.save
    render json: location
  end

  def show
    location = Location.find_by(id: params[:id])
    render json: location
  end

  def update
    location = Location.find_by(id: params[:id])
    location.name = params[:name] || location.name
    lcoation.address = params[:address] || location.address
    location.save
    render json: location.as_json
  end

  def destoy
    location = Location.find_by(id: params[:id])
    location.destroy
    render json: { message: "Location succesfully destroyed" }
  end

end
