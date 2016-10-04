require 'rails_helper'

describe 'Transactions API' do
  it 'returns a list of Transactions' do
    transactions = create_list(:transaction, 3)
    get '/api/v1/transactions.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
    expect(res.first['id']).to eq(transactions.first.id)
  end
  #
  # it 'returns a single Transaction' do
  #   transaction = create(:transaction, name: 'Billy')
  #   get "/api/v1/transactions/#{transaction.id}.json"
  #   res = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(res['name']).to eq('Billy')
  # end
  #
  # it 'returns a random Transaction' do
  #   merc1 = create(:transaction, name: 'Adam')
  #   merc2 = create(:transaction, name: 'Betty')
  #   merc3 = create(:transaction, name: 'Carla')
  #   get "/api/v1/transactions/random.json"
  #   res = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(['Adam', 'Betty', 'Carla']).to include(res['name'])
  # end
end
