class Api::V1::EventsController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :find_event, only: [:update, :destroy] 

  def index
    group = Group.find(params[:group_id])
    members = group.users.select('id', 'name')
    group_with_members = {id: group.id, name: group.name, members: members}

    events = group.events

    debts = group.debts
    expences = group.expences
    render json: { 
      group: group_with_members,
      events: events, 
      debts: debts, 
      members: members, 
      expences: expences 
    }
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: {id: event.id, title: event.title, description: event.description }
    else
      render json: event.errors
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors
    end
  end

  def destroy
    @event.destroy
    render json: @event
  end

  private
  def event_params
    params.require(:event).permit(:title, :description).merge(group_id: params[:group_id])
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
