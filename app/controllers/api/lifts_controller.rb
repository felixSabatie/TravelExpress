module Api
  class LiftsController < ApplicationController

    before_action :set_lift, only: [:show]

    def index
      lifts = Lift.includes([:drivers, :passengers, :rules]).all
      render_json_with_includes(lifts)
    end

    def show
      render_json_with_includes(@lift)
    end

    def create
      lift = Lift.new(lift_params)
      if lift.save
        render_json_with_includes lift
      else
        render status: 422, json: {error: 'Lift is invalid'}
      end
    end

    private

    def set_lift
      @lift = Lift.includes([:drivers, :passengers, :rules]).find(params[:id])
    end

    def render_json_with_includes(data)
      render json: data, include: [:passengers, :rules, :drivers]
    end

    def lift_params
      params.require(:lift).permit(:departure_address, :arrival_address, :car, :capacity, :price,
                                   :departure_date, :arrival_date)
    end

  end
end
