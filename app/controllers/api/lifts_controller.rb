module Api
  class LiftsController < ApplicationController
    before_action :authenticate_account, only: [:create, :add_reservation]
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
      rules = Rule.find params[:rules]
      p rules
      if rules != nil
        lift.rules = rules
      end
      lift.driver = current_account
      if lift.save
        render_json_with_includes lift
      else
        render status: 422, json: {error: 'Lift is invalid'}
      end
    end

    def add_reservation
      lift = Lift.find params[:id]
      nb_seats = params.require(:seats)
      passenger = Passenger.new(seats: nb_seats)
      passenger.account = current_account
      passenger.lift = lift
      if passenger.save
        render json: "success"
      else
        render status: 422, json: {error: 'Reservation is invalid'}
      end
    end

    def search
      render json: Lift.where("lower(departure_city) LIKE :from AND lower(arrival_city) LIKE :to",
                              from: "%#{params.require(:from).downcase}%", to: "%#{params.require(:to).downcase}%")
                       .order(:departure_date)
    end

    private

    def set_lift
      @lift = Lift.includes([:driver, :passengers, :rules]).find(params[:id])
    end

    def render_json_with_includes(data)
      render json: data.to_json(include: [{passengers: {include: :account}}, :rules, :driver])
    end

    def lift_params
      params.require(:lift).permit(:departure_address, :arrival_address, :car, :capacity, :price,
                                   :departure_date, :arrival_date, :departure_city, :arrival_city)
    end

  end
end
