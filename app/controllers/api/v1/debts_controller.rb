class Api::V1::DebtsController < ApplicationController

  def custom_delete
    if params[:group_id]
      target = Debt.where(group_id: params[:group_id], to_id: params[:user_id])
    elsif params[:event_id]
      target = Debt.where(event_id: params[:event_id], to_id: params[:user_id])
    elsif params[:expence_id]
      target = Debt.where(expence_id: params[:expence_id], to_id: params[:user_id])
    else
      target = []
    end

    if target == []
      render json: {status: 302}
    elsif target.destroy_all 
      render json: {status: 200}
    else
      render json: {status: 301}
    end
  end
end
