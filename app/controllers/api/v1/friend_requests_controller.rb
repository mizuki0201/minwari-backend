class Api::V1::FriendRequestsController < ApplicationController
  def create
    friend_request = FriendRequest.new(friend_request_params)
    if friend_request.save
      render json: friend_request
    else
      render json: friend_request.errors
    end
  end

  def destroy
    friend_request = FriendRequest.find(params[:id])
    friend_request.destroy
  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:from_id, :to_id)
  end
end
