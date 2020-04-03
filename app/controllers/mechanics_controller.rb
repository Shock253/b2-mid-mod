class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic_ride = MechanicRide.create(mechanic_id: params[:id], ride_id: params[:ride_id])
    if !mechanic_ride.save
      flash[:notice] = "Could not find ride of given ID"
    end
    redirect_to "/mechanics/#{params[:id]}"
  end
end
