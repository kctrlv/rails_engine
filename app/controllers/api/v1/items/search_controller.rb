class Api::V1::Items::SearchController < ApplicationController

  def show
    render json: Item.find_by(item_params)
  end

private
  def item_params
    params.permit(:id, :name, :description)
  end
end
