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

    if !user
      render json: { status: 302, data: {} }
    elsif user.already_friend?(current_api_v1_user.id)
      render json: { status: 301, data: {id: user.id, name: user.name} }
    elsif user.id != current_api_v1_user.id
      render json: { status: 200, data: {id: user.id, name: user.name} }
    else
      render json: { status: 302, data: {} }
    end
  end
end
