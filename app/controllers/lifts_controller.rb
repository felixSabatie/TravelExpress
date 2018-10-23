class LiftsController < ApplicationController

  before_action :set_lift, only: [:show]

  def index
    lifts = Lift.includes([:drivers, :passengers, :rules]).all
    render_json_with_includes(lifts)
  end

  def show
    render_json_with_includes(@lift)
  end

  private

  def set_lift
    @lift = Lift.includes([:drivers, :passengers, :rules]).find(params[:id])
  end

  def render_json_with_includes(data)
    render json: data, include: [:passengers, :rules, :drivers]
  end

end
