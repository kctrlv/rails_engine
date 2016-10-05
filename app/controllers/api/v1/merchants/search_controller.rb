class Api::V1::Merchants::SearchController < ApplicationController
  def show
    # byebug
    render json: Merchant.find_by(merchant_params)
  end

  def index
    render json: Merchant.where(merchant_params)
  end

  private

  # def parsed_params(params)
  #   params[:created_at] = Time.zone.parse(params[:created_at]) if params[:created_at]
  #   params[:updated_at] = Time.zone.parse(params[:updated_at]) if params[:updated_at]
  #   params
  # end

  def merchant_params
    # parsed_params(params.permit(:id, :name, :created_at, :updated_at))
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
