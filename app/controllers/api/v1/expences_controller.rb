class Api::V1::ExpencesController < ApplicationController
  before_action :find_expence, only: [:update, :destroy] 

  def index
    event = Event.find(params[:event_id])
    expences = event.expences
    render json: expences
  end

  def create
    expence = Expence.new(expence_params)
    if expence.save
      render json: expence
    else
      render json: expence.errors
    end
  end

  def update
    if @expence.update(expence_params)
      render json: @expence
    else
      render json: @expence.errors
    end
  end

  def destroy
    @expence.destroy
    render json: @expence
  end

  private
  def expence_params
    params.require(:expence).permit(:title, :description, :price, :event_id, :user_id)
  end

  def find_expence
    @expence = Expence.find(params[:id])
  end
end
