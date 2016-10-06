require 'rails_helper'

# describe 'Merchants API' do
#   it 'returns a list of Merchants' do
#     merchants = create_list(:merchant, 3)
#     get '/api/v1/merchants.json'
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res.count).to eq(3)
#     expect(res.first['id']).to eq(merchants.first.id)
#   end
# 
#   it 'returns a single Merchant' do
#     merchant = create(:merchant, name: 'Billy')
#     get "/api/v1/merchants/#{merchant.id}.json"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res['name']).to eq('Billy')
#   end
#
#   it 'returns a random Merchant' do
#     merc1 = create(:merchant, name: 'Adam')
#     merc2 = create(:merchant, name: 'Betty')
#     merc3 = create(:merchant, name: 'Carla')
#     get "/api/v1/merchants/random.json"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(['Adam', 'Betty', 'Carla']).to include(res['name'])
#   end
#
#   it 'finds a single merchant by id' do
#     merc = create(:merchant, name: 'Adam')
#     get "/api/v1/merchants/find?id=#{merc.id}"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res['name']).to eq('Adam')
#   end
#
#   it 'finds a single merchant by name' do
#     create(:merchant, name: 'Adam')
#     get "/api/v1/merchants/find?name=Adam"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res['name']).to eq('Adam')
#   end
#
#   it 'finds a single merchant by created at' do
#     merc1 = create(:merchant, name: 'Adam', created_at: "2012-03-27T14:54:05.000Z")
#     merc2 = create(:merchant, name: 'Bob', created_at: "2012-03-28T14:54:05.000Z")
#     merc3 = create(:merchant, name: 'Carla', created_at: "2012-03-29T14:54:05.000Z")
#     get "/api/v1/merchants/find?created_at=#{merc2.created_at}"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res['name']).to eq('Bob')
#   end
#
#   it 'finds a single merchant by updated at' do
#     merc1 = create(:merchant, name: 'Adam', updated_at: "2012-03-27T14:54:05.000Z")
#     merc2 = create(:merchant, name: 'Bob', updated_at: "2012-03-28T14:54:05.000Z")
#     merc3 = create(:merchant, name: 'Carla', updated_at: "2012-03-29T14:54:05.000Z")
#     get "/api/v1/merchants/find?updated_at=#{merc2.updated_at}"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res['name']).to eq('Bob')
#   end
#
#   it 'finds all merchants by created at' do
#     merc1 = create(:merchant, name: 'Adam', created_at: "2012-03-27T14:54:05.000Z")
#     merc2 = create(:merchant, name: 'Bob', created_at: "2012-03-28T14:54:05.000Z")
#     merc3 = create(:merchant, name: 'Carla', created_at: "2012-03-27T14:54:05.000Z")
#     get "/api/v1/merchants/find_all?created_at=2012-03-27T14:54:05.000Z"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res.count).to eq(2)
#     expect(res.first['name']).to eq("Adam")
#     expect(res.last['name']).to eq("Carla")
#   end
#
#   it 'finds all merchants by updated at' do
#     merc1 = create(:merchant, name: 'Adam', updated_at: "2012-03-27T14:54:05.000Z")
#     merc2 = create(:merchant, name: 'Bob', updated_at: "2012-03-28T14:54:05.000Z")
#     merc3 = create(:merchant, name: 'Carla', updated_at: "2012-03-27T14:54:05.000Z")
#     get "/api/v1/merchants/find_all?updated_at=2012-03-27T14:54:05.000Z"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res.count).to eq(2)
#     expect(res.first['name']).to eq("Adam")
#     expect(res.last['name']).to eq("Carla")
#   end
#
#   it 'finds all merchants of an id' do
#     merc = create(:merchant, name: 'Adam')
#     create(:merchant, name: 'Bob')
#     create(:merchant, name: 'Carl')
#     get "/api/v1/merchants/find_all?id=#{merc.id}"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res.count).to eq(1)
#     expect(res.first['id']).to eq(merc.id)
#   end
#
#   it 'finds all merchants of a name' do
#     create(:merchant, name: 'Adam')
#     create(:merchant, name: 'Jim')
#     create(:merchant, name: 'Adam')
#     get "/api/v1/merchants/find_all?name=Adam"
#     res = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(res.count).to eq(2)
#   end
#
#   it 'omits timestamp data from json response' do
#     merchants = create_list(:merchant, 3)
#     get '/api/v1/merchants.json'
#
#     res = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(res.count).to eq(3)
#     expect(res.first.keys).to eq(['id', 'name'])
#   end
# end
#
# describe "Merchants Relationships" do
#   it 'returns a list of items for the merchant' do
#     merchant = create(:merchant)
#     item1 = create(:item, merchant: merchant, name: "Apple")
#     item2 = create(:item, merchant: merchant, name: "Bin")
#     item3 = create(:item, merchant: merchant, name: "Candy")
#     get "/api/v1/merchants/#{merchant.id}/items"
#     raw_items = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(raw_items.count).to eq(3)
#     expect(raw_items.first['name']).to eq("Apple")
#     expect(raw_items.first['merchant_id']).to eq(merchant.id)
#   end
#
#   it 'returns a list of invoices for the merchant' do
#     merchant = create(:merchant)
#     invoice1 = create(:invoice, merchant: merchant, status: "shipped")
#     invoice2 = create(:invoice, merchant: merchant, status: "pending")
#     get "/api/v1/merchants/#{merchant.id}/invoices"
#     raw_invoices = JSON.parse(response.body)
#     expect(response).to be_success
#     expect(raw_invoices.count).to eq(2)
#     expect(raw_invoices.first['status']).to eq("shipped")
#     expect(raw_invoices.first['merchant_id']).to eq(merchant.id)
#     expect(raw_invoices.last['status']).to eq("pending")
#   end
# end

describe "Single Merchant Business Intelligence" do
  it 'finds total revenue for single merchant' do
    merchant       = create(:merchant)
    invoice_1      = create(:invoice, merchant: merchant)
    invoice_2      = create(:invoice, merchant: merchant)

    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 1000)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 1500)

    invoice_item_3 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 200)
    invoice_item_4 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 300)

    create(:transaction, invoice: invoice_1, result: "failed")
    create(:transaction, invoice: invoice_1, result: "success")
    create(:transaction, invoice: invoice_2, result: "success")

    get "/api/v1/merchants/#{merchant.id}/revenue"
    revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(revenue['revenue']).to eq("3500.00")
  end
end
