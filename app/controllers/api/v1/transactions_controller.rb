class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params['id'])
  end

  def random
    render json: Transaction.all.sample
  end
end
