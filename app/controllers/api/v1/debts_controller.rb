class Api::V1::DebtsController < ApplicationController
  before_action :find_debt, only: [:update, :destroy]

  def create
    debt = Debt.new(debt_params)
    if debt.save
      render json: debt
    else
      render json: debt.errors
    end
  end

  def update
    if @debt.update(debt_params)
      render json: @debt
    else
      render json: @debt.errors
    end
  end

  def destroy
    @debt.destroy
    render json: @debt
  end

  private
  def debt_params
    params.require(:debt).peremit(:price, :from_id, :to_id, :event_id)
  end

  def find_debt
    @debt = Debt.find(params[:id])
  end
end
