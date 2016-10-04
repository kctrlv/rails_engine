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

  it "returns a random item" do
    create(:item, name: "Beach Ball")
    create(:item, name: "Teddy Bear")
    create(:item, name: "Foam No.1 Fan Glove")
    get '/api/v1/items/random.json'

    random_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(['Beach Ball', 'Teddy Bear', 'Foam No.1 Fan Glove']).
    to include(random_item["name"])
  end

  it "finds a single item by id" do
    item = create(:item, name: "Beach Ball")
    get "/api/v1/items/find?id=#{item.id}"

    raw_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_item["name"]).to eq("Beach Ball")
  end

  it "finds a single item by name" do
    item = create(:item, name: "Beach Ball")
    get "/api/v1/items/find?name=#{item.name}"

    raw_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_item["name"]).to eq("Beach Ball")
  end
end
