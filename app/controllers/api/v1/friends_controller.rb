class Api::V1::FriendsController < ApplicationController
  def create
    friend = Friend.new(friend_params)
    if friend.save
      render json: friend
    else
      render json: friend.errors
    end
  end

  def destroy
    # 後々、友達解除機能も追加したい
    # friend = Friend.find(params[:id])
    # friend.destroy
  end

  private
  def friend_params
    params.require(:friend).permit(:from_id, :to_id)
  end
end
