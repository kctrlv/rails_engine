require 'rails_helper'

describe "Invoices CRUD API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get '/api/v1/invoices.json'

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end

  it "returns a single invoice" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/#{invoice.id}.json"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice["status"]).to eq("shipped")
  end

  it "returns a random invoice" do
    create(:invoice, status: "pending")
    create(:invoice, status: "shipped")
    create(:invoice, status: "returned")
    get '/api/v1/invoices/random.json'

    random_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(['pending', 'shipped', 'returned']).
    to include(random_invoice["status"])
  end
end
