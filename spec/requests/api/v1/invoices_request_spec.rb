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

  it "finds a single invoice by id" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?id=#{invoice.id}"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice["id"]).to eq(invoice.id)
    expect(raw_invoice["status"]).to eq("shipped")
  end

  it "finds a single invoice by merchant id" do
    merchant = create(:merchant)
    invoice  = create(:invoice, merchant: merchant)
    get "/api/v1/invoices/find?merchant_id=#{merchant.id}"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice["id"]).to eq(invoice.id)
    expect(raw_invoice["merchant_id"]).to eq(merchant.id)
  end

  it "finds a single invoice by customer id" do
    customer = create(:customer)
    invoice  = create(:invoice, customer: customer)
    get "/api/v1/invoices/find?customer_id=#{customer.id}"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice["id"]).to eq(invoice.id)
    expect(raw_invoice["customer_id"]).to eq(customer.id)
  end

  it "finds a single invoice by status" do
    invoice  = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?status=#{invoice.status}"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice["id"]).to eq(invoice.id)
    expect(raw_invoice["status"]).to eq("shipped")
  end

  it "finds all invoices by id" do
    invoice = create(:invoice)
              create_list(:invoice, 2)
    get "/api/v1/invoices/find_all?id=#{invoice.id}"

    raw_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoice).to be_an(Array)
    expect(raw_invoice[0]["id"]).to eq(invoice.id)
  end

  it "finds all invoices by merchant id" do
    merchant = create(:merchant)
               create(:invoice, merchant: merchant)
               create(:invoice, merchant: merchant)
               create(:invoice)
    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    raw_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoices).to be_an(Array)
    expect(raw_invoices.count).to eq(2)
    expect(raw_invoices[0]["merchant_id"]).to eq(merchant.id)
  end

  it "finds all invoices by customer id" do
    customer = create(:customer)
               create(:invoice, customer: customer)
               create(:invoice, customer: customer)
               create(:invoice)
    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    raw_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoices).to be_an(Array)
    expect(raw_invoices.count).to eq(2)
    expect(raw_invoices[0]["customer_id"]).to eq(customer.id)
  end

  it "finds all invoices by status" do
    create(:invoice, status: "pending")
    create(:invoice, status: "pending")
    create(:invoice)
    get "/api/v1/invoices/find_all?status=pending"

    raw_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_invoices).to be_an(Array)
    expect(raw_invoices.count).to eq(2)
    expect(raw_invoices[0]["status"]).to eq("pending")
  end
end
