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

  it "finds a single invoice item by id" do
    invoice_item = create(:invoice_item, quantity: 101)
    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["quantity"]).to eq(101)
  end

  it "finds a single invoice item by item id" do
    item         = create(:item)
    invoice_item = create(:invoice_item, item: item)
    get "/api/v1/invoice_items/find?item_id=#{item.id}"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["item_id"]).to eq(item.id)
  end

  it "finds a single invoice item by invoice id" do
    invoice      = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)
    get "/api/v1/invoice_items/find?invoice_id=#{invoice.id}"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["invoice_id"]).to eq(invoice.id)
  end

  it "finds a single invoice item by quantity" do
    invoice_item = create(:invoice_item, quantity: 202)
    get "/api/v1/invoice_items/find?quantity=202"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["quantity"]).to eq(202)
  end

  it "finds a single invoice item by quantity" do
    invoice_item = create(:invoice_item, quantity: 202)
    get "/api/v1/invoice_items/find?quantity=202"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["quantity"]).to eq(202)
  end

  it "finds a single invoice item by unit price" do
    invoice_item = create(:invoice_item, unit_price: 2000)
    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["unit_price"]).to eq(2000)
  end

  xit "finds a single invoice item by creation date" do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"
    byebug

    raw_ii = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_ii["id"]).to eq(invoice_item.id)
    expect(raw_ii["created_at"]).to eq(invoice_item.created_at)
  end

  it 'omits timestamp data from json response' do
    invoice_items = create_list(:invoice_item, 3)
    get '/api/v1/invoice_items.json'
    res = JSON.parse(response.body)
    expect(response).to be_success
    expect(res.count).to eq(3)
    expect(res.first.keys).to eq(['id', 'item_id', 'invoice_id', 'quantity', 'unit_price'])
  end

end
