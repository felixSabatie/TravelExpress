class LiftsController < ApplicationController

  def index
    lifts = Lift.includes([:drivers, :passengers, :rules]).all
    render json: lifts, include: [:passengers, :rules, :drivers]
  end

end
