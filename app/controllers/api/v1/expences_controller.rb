class Api::V1::ExpencesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_expence, only: [:update, :destroy] 

  def index
    event = Event.find(params[:event_id])
    members = event.group.users.select('id', 'name')
    expences = event.expences
    render json: {event: event, expences: expences, members: members}
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
    if @expence.destroy
      render json: {status: 200}
    else
      render json: {status: 301}
    end
  end

  private
  def expence_params
    params.require(:expence).permit(:title, :description, :price, :event_id, :user_id)
  end

  def find_expence
    @expence = Expence.find(params[:id])
  end
end
