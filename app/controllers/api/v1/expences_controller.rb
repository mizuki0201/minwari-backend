class Api::V1::ExpencesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_expence, only: [:update, :destroy] 

  def index
    event = Event.find(params[:event_id])
    members = event.group.get_members
    expences = event.expences.map do |expence|
      expence.add_username_to_expence
    end
    debts = Debt.where(event_id: params[:event_id])
    render json: {event: event, expences: expences, members: members, debts: debts}
  end

  def create
    expence_debt_form = ExpenceDebtForm.new(expence_params)

    if expence_debt_form.valid? 
      expence_debt = expence_debt_form.save
      expence_with_user = expence_debt[:expence].add_username_to_expence
      render json: { expence: expence_with_user, debts: expence_debt[:debts] }
    else
      expence_debt json: expence_debt.errors
    end
  end

  # 更新機能は今後実装予定
  # def update
  #   if @expence.update(expence_params)
  #     render json: add_username_to_expence(@expence)
  #   else
  #     render json: @expence.errors
  #   end
  # end

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
      .permit(:title, :description, :price, :event_id, :user_id, :group_id)
  end

  def find_expence
    @expence = Expence.find(params[:id])
  end
end
