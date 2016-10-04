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

  # it 'returns a single Customer' do
  #   customer = create(:customer, name: 'Billy')
  #   get "/api/v1/customers/#{customer.id}.json"
  #   res = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(res['name']).to eq('Billy')
  # end
  #
  # it 'returns a random Customer' do
  #   merc1 = create(:customer, name: 'Adam')
  #   merc2 = create(:customer, name: 'Betty')
  #   merc3 = create(:customer, name: 'Carla')
  #   get "/api/v1/customers/random.json"
  #   res = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(['Adam', 'Betty', 'Carla']).to include(res['name'])
  # end
end
