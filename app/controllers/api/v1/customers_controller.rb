class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params['id'])
  end

  def random
    render json: Customer.all.sample
  end
end
