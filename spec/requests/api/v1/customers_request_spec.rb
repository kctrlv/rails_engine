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
    get "/api/v1/customers/random"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(['Adam', 'Betty', 'Carla']).to include(res['first_name'])
  end

  it 'finds a single customer by id' do
    cust = create(:customer, first_name: 'Hannah')
    get "/api/v1/customers/find?id=#{cust.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['first_name']).to eq('Hannah')
  end

  it 'finds a single customer by first name' do
    create(:customer, first_name: 'Bob')
    get "/api/v1/customers/find?first_name=Bob"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['first_name']).to eq('Bob')
  end

  it 'finds a single customer by last name' do
    create(:customer, last_name: 'Stevenson')
    get "/api/v1/customers/find?last_name=Stevenson"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res['last_name']).to eq('Stevenson')
  end

  it 'finds all customers of an id' do
    cust = create(:customer, first_name: 'Adam')
    create(:customer, first_name: 'Bob')
    create(:customer, first_name: 'Carl')
    get "/api/v1/customers/find_all?id=#{cust.id}"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(1)
    expect(res.first['id']).to eq(cust.id)
  end

  it 'finds all customers of a first name' do
    create(:customer, first_name: 'Adam')
    create(:customer, first_name: 'Jim')
    create(:customer, first_name: 'Adam')
    get "/api/v1/customers/find_all?first_name=Adam"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(2)
    expect(res.first['first_name']).to eq("Adam")
  end

  it 'finds all customers of a last name' do
    create(:customer, last_name: 'Boberta')
    create(:customer, last_name: 'Jim')
    create(:customer, last_name: 'Boberta')
    get "/api/v1/customers/find_all?last_name=Boberta"
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(2)
    expect(res.last['last_name']).to eq("Boberta")
  end
end
