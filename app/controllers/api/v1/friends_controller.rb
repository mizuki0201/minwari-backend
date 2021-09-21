class Api::V1::FriendsController < ApplicationController
  before_action :authenticate_api_v1_user!
  
  def index
    friends_from = Friend.get_friends_with_from_id(current_api_v1_user)
    friends_to = Friend.get_friends_with_to_id(current_api_v1_user)
    friends = friends_from + friends_to

    render json: friends
  end

  def create
    friend = Friend.find_or_initialize_by(friend_params)
    if !friend.new_record?
      render json: {status: 302}
    elsif friend.save
      render json: {status: 200}
    else
      render json: {status: 301}
    end
  end

  def destroy
    # 後々、友達解除機能も追加したい
    # friend = Friend.find(params[:id])
    # friend.destroy
  end

  private
  def friend_params
    params.require(:friend).permit(:to_id).merge(from_id: current_api_v1_user.id)
  end
end
