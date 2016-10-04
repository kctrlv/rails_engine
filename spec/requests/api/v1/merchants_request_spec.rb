require 'rails_helper'

describe 'Merchants API' do
  it 'returns a list of Merchants' do
    create_list(:merchant, 3)
    get '/api/v1/merchants.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
  end
  #
  # it 'returns one item' do
  #   item = create(:item, name: "Cool Item")
  #   get "/api/v1/items/#{item.id}"
  #   res = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(res['name']).to eq(item.name)
  # end
  #
  # it 'creates a new item' do
  #   parameters = {name: "Cookie", description: "Vanilla"}
  #   expect {
  #     post '/api/v1/items', parameters
  #   }.to change { Item.count }.by(1)
  #   res = JSON.parse(response.body)
  #   expect(res['name']).to eq(parameters[:name])
  #   expect(res['description']).to eq(parameters[:description])
  # end
end
