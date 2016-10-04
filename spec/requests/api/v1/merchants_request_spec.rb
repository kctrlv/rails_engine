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

  it 'returns a random Merchant' do
    merc1 = create(:merchant, name: 'Adam')
    merc2 = create(:merchant, name: 'Betty')
    merc3 = create(:merchant, name: 'Carla')
    get "/api/v1/merchants/random.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(['Adam', 'Betty', 'Carla']).to include(res['name'])
  end

  it 'finds a single merchant by id' do
    merc = create(:merchant, name: 'Adam')
    get "/api/v1/merchants/find?id=#{merc.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['name']).to eq('Adam')
  end

  it 'finds a single merchant by name' do
    create(:merchant, name: 'Adam')
    get "/api/v1/merchants/find?name=Adam"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['name']).to eq('Adam')
  end
end
