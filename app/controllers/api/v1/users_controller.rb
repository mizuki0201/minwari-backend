class Api::V1::UsersController < ApplicationController
  def index
    # if params[:keyword] == ""
    #   render json: { status: 301, data: {} }
    # else
    #   ele = {
    #     obj: User,
    #     keyword_column: 'user_id',
    #     keyword: params[:keyword]
    #   }
    #   user = SearchService.search_one_result(ele)
    #   render json: { status: 200, data: {id: user.id, name: user.name} }
      search
    # end
  end

  def search
    ele = {
      obj: User,
      keyword_column: 'user_id',
      keyword: params[:keyword]
    }
    user = SearchService.search_one_result(ele)
    if user
      render json: { status: 200, data: {id: user.id, name: user.name} }
    else
      render json: { status: 404, data: {} }
    end
  end
end
