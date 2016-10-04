require 'rails_helper'

describe 'Merchants API' do
  it 'returns a list of Merchants' do
    create_list(:merchant, 3)
    get '/api/v1/merchants.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
  end
end
