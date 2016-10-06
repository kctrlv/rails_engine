class Api::V1::Merchants::SingleMerchantRevenueController < ApplicationController
  def show
    render json: Merchant.find(params['id']).revenue
  end
end
