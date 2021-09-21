class Api::V1::DebtsController < ApplicationController

  def custom_delete
    if params[:group_id]
      delete_data = Debt.get_debt_with_group(params[:group_id], params[:user_id])
    elsif params[:event_id]
      delete_data = Debt.get_debt_with_event(params[:event_id], params[:user_id])
    elsif params[:expence_id]
      delete_data = Debt.get_debt_with_expence(params[:expence_id], params[:user_id])
    else
      delete_data = []
    end

    if delete_data == []
      render json: {status: 302}
    elsif delete_data.destroy_all
      render json: {status: 200}
    else
      render json: {status: 301}
    end
  end
end
