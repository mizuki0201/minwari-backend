class Api::V1::FriendRequestsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    friend_request = FriendRequest.find_or_initialize_by(friend_request_params)
    if friend_request.new_record?
      if friend_request.save
        render json: {status: 200}
      else
        render json: {status: 301}
      end
    else
      render json: {status: 302}
    end

  end

  def destroy
    friend_request = FriendRequest.find(params[:id])
    friend_request.destroy
  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:to_id).merge(from_id: current_api_v1_user.id)
  end
end
