class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_group, only: [:update, :destroy] 

  def index
    groups = current_api_v1_user.groups
    group_with_members = []
    groups.each do |group|
      member = group.users.select('id', 'name')
      group_with_members << {id: group.id, name: group.name, menber: member}
    end
    render json: group_with_members
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
