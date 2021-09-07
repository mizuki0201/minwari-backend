class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_group, only: [:update, :destroy] 

  def index
    # current_api_v1_user
    # binding.pry
    groups = Group.all
    render json: groups
  end

  def create
    group = Group.new(group_params)
    if group.save
      group.users << current_api_v1_user
      render json: group
    else
      render json: group.errors
    end
  end

  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors
    end
  end

  def destroy
    @group.destroy
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
