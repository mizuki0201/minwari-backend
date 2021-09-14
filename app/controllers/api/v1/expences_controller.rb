class Api::V1::ExpencesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_expence, only: [:update, :destroy] 

  def index
    event = Event.find(params[:event_id])
    members = event.group.users.select('id', 'name')
    expences = event.expences.map do |expence|
      add_username_to_expence(expence)
    end
    render json: {event: event, expences: expences, members: members}
  end

  def create
    expence_debt = ExpenceDebtForm.new(expence_params)
    if expence_debt.save
      render json: expence_debt
      # render json: add_username_to_expence(expence_debt)
    else
      expence_debt json: expence_debt.errors
    end
  end

  def update
    if @expence.update(expence_params)
      render json: add_username_to_expence(@expence)
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
    params
      .require(:expence)
      .permit(:title, :description, :price, :event_id, :user_id, :group_id, :members)
  end

  def find_expence
    @expence = Expence.find(params[:id])
  end

  def add_username_to_expence(expence)
    new_expence = expence.attributes
    new_expence['user_name'] = User.find(expence.user_id).attributes['name']
    return new_expence
  end
end
