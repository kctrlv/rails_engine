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

  it 'finds a single transaction by id' do
    tx = create(:transaction)
    get "/api/v1/transactions/find?id=#{tx.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['id']).to eq(tx.id)
  end

  it 'finds a single transaction by invoice id' do
    invoice = create(:invoice)
    tx = create(:transaction, invoice: invoice)
    get "/api/v1/transactions/find?invoice_id=#{invoice.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['invoice_id']).to eq(invoice.id)
  end


  it 'finds a single transaction by cc number' do
    tx = create(:transaction, credit_card_number: '1001200210012002')
    get "/api/v1/transactions/find?credit_card_number=1001200210012002"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['credit_card_number']).to eq('1001200210012002')
  end

  it 'finds a single transaction by cc exp date' do
    tx = create(:transaction, credit_card_expiration_date: '01/2020')
    get "/api/v1/transactions/find?credit_card_expiration_date=01/2020"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['credit_card_expiration_date']).to eq('01/2020')
  end

  it 'finds a single transaction by result' do
    tx = create(:transaction, result: 'failed')
    get "/api/v1/transactions/find?result=failed"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['result']).to eq('failed')
  end



end
