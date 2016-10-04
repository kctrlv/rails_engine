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

  it 'returns a single Transaction' do
    transaction = create(:transaction, credit_card_number: '1001200230034004')
    get "/api/v1/transactions/#{transaction.id}.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['credit_card_number']).to eq('1001200230034004')
  end

  it 'returns a random Transaction' do
    tx1 = create(:transaction, credit_card_number: '1001')
    tx2 = create(:transaction, credit_card_number: '1002')
    tx3 = create(:transaction, credit_card_number: '1003')
    get "/api/v1/transactions/random.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(['1001', '1002', '1003']).to include(res['credit_card_number'])
  end
end
