class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.top_items_sold(params['quantity'])
  end
end
