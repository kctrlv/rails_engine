require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to(:item) }

  it { should belong_to(:invoice) }

  it "can calculate its total cost" do
    invoice_item = create(:invoice_item, quantity: 10, unit_price: 10.00)

    expect(invoice_item.total).to eq(100.00)
  end
end
