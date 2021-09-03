class Api::V1::EventsController < ApplicationController
  before_action :find_event, only: [:update, :destroy] 

  def index
    group = Group.find(params[:group_id])
    events = group.events
    render json: events
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event
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
    params.require(:event).permit(:title, :description, :date, :group_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
