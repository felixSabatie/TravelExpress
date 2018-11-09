module Api
  class AccountsController < ApplicationController
    before_action :authenticate_account, only: [:current]
    before_action :set_account, only: [:show, :update]

    def show
      render_json_with_includes(@account)
    end

    def update
      if @account.update(params.require(:account).permit(:first_name, :last_name, :email, :phone))
        render status: 200
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    def create
      account_params = params.require(:account).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      account = Account.new(account_params)
      if account.save
        render_json_with_includes(account)
      else
        render status: 422, json: {error: 'Account is invalid'}
      end
    end

    def current
      render_json_with_includes(current_account)
    end

    private

    def set_account
      @account = Account.includes([:drivers, :passengers]).find(params[:id])
    end

    def render_json_with_includes(data)
      render json: data, include: [:passengers, :drivers], except: [:password_digest]
    end
  end
end
