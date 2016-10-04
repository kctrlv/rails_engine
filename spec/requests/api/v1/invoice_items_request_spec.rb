require 'rails_helper'

describe "Invoice Items CRUD API" do
  it "returns a list of invoice items" do
    create_list(:invoice_item, 3)
    get '/api/v1/invoice_items.json'

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "returns a single invoice item" do
    invoice_item = create(:invoice_item, quantity: 30)
    get "/api/v1/invoice_items/#{invoice_item.id}.json"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["quantity"]).to eq(30)
  end

  it "returnes a random invoice item" do
    create(:invoice_item, quantity: 10)
    create(:invoice_item, quantity: 20)
    create(:invoice_item, quantity: 30)
    get '/api/v1/invoice_items/random.json'

    random_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect([10, 20, 30]).
    to include(random_ii["quantity"])
  end
end
