require 'rails_helper'

describe 'Customers API' do
  it 'returns a list of Customers' do
    customers = create_list(:customer, 3)
    get '/api/v1/customers.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
    expect(res.first['id']).to eq(customers.first.id)
  end

  it 'returns a single Customer' do
    customer = create(:customer, first_name: 'Billy', last_name: 'Bobson')
    get "/api/v1/customers/#{customer.id}.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['first_name']).to eq('Billy')
    expect(res['last_name']).to eq('Bobson')
  end

  it 'returns a random Customer' do
    cust1 = create(:customer, first_name: 'Adam')
    cust2 = create(:customer, first_name: 'Betty')
    cust3 = create(:customer, first_name: 'Carla')
    get "/api/v1/customers/random.json"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(['Adam', 'Betty', 'Carla']).to include(res['first_name'])
  end
end
