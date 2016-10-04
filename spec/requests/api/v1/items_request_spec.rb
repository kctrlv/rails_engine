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

  it "finds a single item by description" do
    item = create(:item, description: "Light-weight and versitile")
    get "/api/v1/items/find?description=#{item.description}"

    raw_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_item["description"]).to eq("Light-weight and versitile")
  end

  it "finds all items by id" do
    item = create(:item, name: "Foam No.1 Fan Glove")
           create(:item, name: "Beach Ball")
           create(:item, name: "Teddy Bear")
    get "/api/v1/items/find_all?id=#{item.id}"

    raw_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(raw_item).to be_a(Array)
    expect(raw_item[0]["name"]).to eq("Foam No.1 Fan Glove")
  end

  it "finds all items by name" do
    create_list(:item, 3)
    item = create(:item, name: "Teddy Bear")
    get "/api/v1/items/find_all?name=MyText"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(3)
    expect(items[0]["name"]).to eq("MyText")
  end

  it "finds all items by description" do
    create_list(:item, 3)
    item = create(:item, description: "Woohoo")
    get "/api/v1/items/find_all?description=MyText"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(3)
    expect(items[0]["description"]).to eq("MyText")
  end
end
