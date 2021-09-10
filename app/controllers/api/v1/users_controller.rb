class Api::V1::UsersController < ApplicationController
  def index
    if params[:keyword] == ""
      render json: { status: 301, data: {} }
    else
      search
    end
  end

  private
  def search
    ele = {
      obj: User,
      keyword_column: 'user_id',
      keyword: params[:keyword]
    }
    user = SearchService.search_one_result(ele)

    if already_friend(user.id)
      render json: { status: 301, data: {id: user.id, name: user.name} }
    elsif user && user.id != current_api_v1_user.id
      render json: { status: 200, data: {id: user.id, name: user.name} }
    else
      render json: { status: 404, data: {} }
    end
  end

  def already_friend(user_id)
    Friend.exists?(from_id: current_api_v1_user.id, to_id: user_id) || Friend.exists?(from_id: user_id, to_id: current_api_v1_user.id)
  end
end
