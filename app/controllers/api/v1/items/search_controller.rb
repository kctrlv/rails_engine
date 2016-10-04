class Api::V1::Items::SearchController < ApplicationController

  def show
    render json: Item.find(params[:id])
  end
end
