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

  it 'finds all merchants of an id' do
    merc = create(:merchant, name: 'Adam')
    create(:merchant, name: 'Bob')
    create(:merchant, name: 'Carl')
    get "/api/v1/merchants/find_all?id=#{merc.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(1)
    expect(res.first['id']).to eq(merc.id)
  end

  it 'finds all merchants of a name' do
    create(:merchant, name: 'Adam')
    create(:merchant, name: 'Jim')
    create(:merchant, name: 'Adam')
    get "/api/v1/merchants/find_all?name=Adam"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(2)
  end

  it 'finds total revenue for single merchant' do
    merchant       = create(:merchant)
    invoice_1      = create(:invoice, merchant: merchant)
    invoice_2      = create(:invoice, merchant: merchant)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, unit_price: 1000)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, unit_price: 1500)
    invoice_item_3 = create(:invoice_item, invoice: invoice_2, unit_price: 200)
    invoice_item_4 = create(:invoice_item, invoice: invoice_2, unit_price: 300)
    transaction_1  = create(:transaction, invoice: invoice_1, result: "failed")
    transaction_2  = create(:transaction, invoice: invoice_1, result: "success")
    transaction_3  = create(:transaction, invoice: invoice_2, result: "success")

    get "/api/v1/merchants/#{merchant.id}/revenue"
  end
end
