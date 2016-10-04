require 'rails_helper'

describe 'Merchants API' do
  it 'returns a list of Merchants' do
    merchants = create_list(:merchant, 3)
    get '/api/v1/merchants.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
    expect(res.first['id']).to eq(merchants.first.id)
  end

  it 'returns a single Merchant' do
    merchant = create(:merchant, name: 'Billy')
    get "/api/v1/merchants/#{merchant.id}.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['name']).to eq('Billy')
  end
end
