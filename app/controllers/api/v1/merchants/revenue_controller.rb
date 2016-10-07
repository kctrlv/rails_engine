class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: { "total_revenue": Merchant.total_revenue_by_date(params[:date]) }
  end
end
