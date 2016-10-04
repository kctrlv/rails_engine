require 'rails_helper'

describe "Items CRUD API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get '/api/v1/items.json'

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "returns a single item" do
    item = create(:item, name: "Sparkly Super Bounce Bouncy Ball")
    get "/api/v1/items/#{item.id}.json"

    raw_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_item["name"]).to eq("Sparkly Super Bounce Bouncy Ball")
  end
end
